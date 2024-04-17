import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eden/app/app_router.dart';
import 'package:eden/model/auth_exception.dart';
import 'package:eden/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_signin_aksoyhlc/github_signin_aksoyhlc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _auth.currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GithubParamsModel _gitHubSignIn = GithubParamsModel(
    clientId: const String.fromEnvironment('GITHUB_CLIENT_ID'),
    clientSecret: const String.fromEnvironment('GITHUB_CLIENT_SECRET'),
    callbackUrl: const String.fromEnvironment('GITHUB_AUTH_URL'),
    scopes: 'read:user, user:email',
  );
  Future<bool> saveUserDetails(UserModel userModel) async {
    try {
      await _firestore
          .collection('Users')
          .doc(userModel.uid)
          .set(userModel.toMap());

      return true;
    } on FirebaseAuthException catch (e, s) {
      debugPrint('$e\n$s');
      final message = AuthExceptionHandler.handleFirebaseAuthException(e);
      throw AuthException(message);
    } on Exception catch (e, s) {
      debugPrint('$e\n$s');
      rethrow;
    }
  }

  Future<UserModel> getCurrentUserData(String email, String password) async {
    try {
      final response = await _firestore.doc(_auth.currentUser!.uid).get();
      if (response.data() != null) {
        return UserModel.fromMap(response.data()!);
      }
      throw AuthException('User not found');
    } on FirebaseAuthException catch (e) {
      final message = AuthExceptionHandler.handleFirebaseAuthException(e);
      throw AuthException(message);
    } on Exception catch (e, s) {
      debugPrint('$e\n$s');
      rethrow;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        throw AuthException('Google sign in cancelled');
      }
      return true;
    } on FirebaseAuthException catch (e, s) {
      debugPrint('$e\n$s');
      final message = AuthExceptionHandler.handleFirebaseAuthException(e);
      throw AuthException(message);
    } on Exception catch (e, s) {
      debugPrint('Error signing in with Google: $e\n$s');
      throw AuthException(e.toString());
    }
  }

  Future<bool> signInWithGithub() async {
    try {
      final result = await AppRouter.router.push(
        AppRoutes.dashboard,
        extra: _gitHubSignIn,
      );
      if (result == null) {
        // user cancelled the sign in or error occurred
      }

      var data = result as GithubSignInResponse;

      if (data.status != ResultStatus.success) {
        print(result.message);
      }

      return true;
    } on FirebaseAuthException catch (e, s) {
      debugPrint('$e\n$s');
      final message = AuthExceptionHandler.handleFirebaseAuthException(e);
      throw AuthException(message);
    } on Exception catch (e, s) {
      debugPrint('Error signing in with Google: $e\n$s');
      throw AuthException(e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
