import 'package:flutter/material.dart';
import 'package:github_signin_aksoyhlc/github_signin_aksoyhlc.dart';
import 'package:go_router/go_router.dart';

class GithubAuthScreen extends StatelessWidget {
  final GithubParamsModel params;
  const GithubAuthScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return GithubSignIn(
      hasData: false,
      params: params,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            'Sign in with Github',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
