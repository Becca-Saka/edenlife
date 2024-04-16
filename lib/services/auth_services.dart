import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eden/exceptions/auth_exception.dart';
import 'package:eden/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _auth.currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GitHubSignIn _gitHubSignIn = GitHubSignIn(
    clientId: const String.fromEnvironment('GITHUB_CLIENT_ID'),
    clientSecret: const String.fromEnvironment('GITHUB_CLIENT_SECRET'),
    redirectUrl: const String.fromEnvironment('GITHUB_AUTH_URL'),
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
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      debugPrint('Error signing in with Google: $e');
      return false;
    }
  }

  Future<bool> signInWithGithub(context) async {
    try {
      final result = await _gitHubSignIn.signIn(context);
      if (result.token != null) {
        final githubAuthCredential =
            GithubAuthProvider.credential(result.token!);
        await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);
      }

      return true;
    } catch (e) {
      debugPrint('Error signing in with Google: $e');
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
