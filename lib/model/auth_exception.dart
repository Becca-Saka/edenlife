import 'package:flutter/material.dart';

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => 'AuthException(message: $message)';
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
      case 'account-exists-with-different-credential':
        status =
            'You have already signed up with a different auth provider for that email.';

      default:
        status = "An undefined Error happened.";
    }
    return status;
  }
}
