import 'package:eden/data/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: provider.signInWithGoogle,
                child: const Text('Sign In With Google'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: provider.signInWithGithub,
                child: const Text('Sign In With Github'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
