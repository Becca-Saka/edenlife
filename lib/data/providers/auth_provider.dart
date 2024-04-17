import 'package:eden/app/app_router.dart';
import 'package:eden/data/services/auth_services.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  AuthProvider({required AuthService authService}) : _authService = authService;
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    final response = _authService.currentUser;
    if (response != null) {
      AppRouter.router.push(AppRoutes.dashboard);
    } else {
      AppRouter.router.push(AppRoutes.signIn);
    }
  }

  Future<void> signInWithGoogle() async {
    final response = await _authService.signInWithGoogle();
    if (response) {
      AppRouter.router.push(AppRoutes.dashboard);
      // _authService.saveUserDetails();
    }
  }

  Future<void> signInWithGithub() async {
    final response = await _authService.signInWithGithub();
    if (response) {
      AppRouter.router.push(AppRoutes.dashboard);
    }
  }
}
