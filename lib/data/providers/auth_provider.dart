import 'package:eden/app/app_router.dart';
import 'package:eden/data/services/auth_services.dart';
import 'package:eden/model/auth_exception.dart';
import 'package:eden/shared/app_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  AuthProvider({required AuthService authService}) : _authService = authService;
  bool isGoogleLoading = false;
  bool isGithubLoading = false;

  User? get currentUser => _authService.currentUser;

  void setGoogleLoading(bool value) {
    isGoogleLoading = value;
    notifyListeners();
  }

  void setGithubLoading(bool value) {
    isGithubLoading = value;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    // AppRouter.router.push(AppRoutes.dashboard);
    if (currentUser != null) {
      AppRouter.router.push(AppRoutes.dashboard);
    } else {
      AppRouter.router.push(AppRoutes.signIn);
    }
  }

  Future<void> signOut() async {
    AppRouter.router.push(AppRoutes.signIn);
    _authService.signOut();
  }

  Future<void> signInWithGoogle() async {
    try {
      setGoogleLoading(true);
      final response = await _authService.signInWithGoogle();
      setGoogleLoading(false);
      if (response) {
        AppRouter.router.push(AppRoutes.dashboard);
      }
    } on AuthException catch (e) {
      setGoogleLoading(false);
      AppSnackBar.showErrorCustomSnackbar(message: e.message);
    }
  }

  Future<void> signInWithGithub() async {
    try {
      setGithubLoading(true);
      final response = await _authService.signInWithGithub();
      setGithubLoading(false);
      if (response) {
        AppRouter.router.push(AppRoutes.dashboard);
      }
    } on AuthException catch (e) {
      setGithubLoading(false);
      AppSnackBar.showErrorCustomSnackbar(message: e.message);
    }
  }
}
