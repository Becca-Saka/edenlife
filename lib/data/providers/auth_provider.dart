import 'package:eden/app/app_router.dart';
import 'package:eden/data/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  AuthProvider({required AuthService authService}) : _authService = authService;
  bool isLoading = false;

  User? get currentUser => _authService.currentUser;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    AppRouter.router.push(AppRoutes.dashboard);
    // if (currentUser != null) {
    //   AppRouter.router.push(AppRoutes.dashboard);
    // } else {
    //   AppRouter.router.push(AppRoutes.signIn);
    // }
  }

  Future<void> signInWithGoogle() async {
    final response = await _authService.signInWithGoogle();
    if (response) {
      AppRouter.router.push(AppRoutes.dashboard);
    }
  }

  Future<void> signInWithGithub() async {
    final response = await _authService.signInWithGithub();
    if (response) {
      AppRouter.router.push(AppRoutes.dashboard);
    }
  }
}
