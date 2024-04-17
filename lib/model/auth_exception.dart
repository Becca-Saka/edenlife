import 'package:flutter/material.dart';

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}

class AuthExceptionHandler {
  static handleFirebaseAuthException(e) {
    debugPrint(e.code);
    String status;
    switch (e.code) {
      case 'invalid-credential':
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        status = 'Incorrect email or password';
      case 'too-many-requests':
        status = 'You have made too many requests. Try again later.';

      default:
        status = "An undefined Error happened.";
    }
    return status;
  }
}
