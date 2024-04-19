// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eden/data/providers/auth_provider.dart';
import 'package:eden/shared/app_colors.dart';
import 'package:eden/shared/app_spacing.dart';
import 'package:eden/shared/app_text_style.dart';
import 'package:eden/shared/widget/app_button.dart';
import 'package:eden/shared/widget/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.02),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  const Center(
                    child: AppIcons(
                      icon: AppIconData.delivery,
                      size: 240,
                    ),
                  ),
                  AppSpacing.v24(),
                  Text(
                    'Welcome to Eden tracker',
                    style: AppTextStyle.bold20.copyWith(
                      fontSize: 30,
                    ),
                  ),
                  const AppSpacing(v: 4),
                  Text(
                    'Your one stop solution for tracking your orders',
                    style: AppTextStyle.regular16,
                  ),
                  const Spacer(flex: 2),
                  AppButton(
                    isLoading: provider.isGoogleLoading,
                    onPressed: provider.signInWithGoogle,
                    icon: AppIconData.google,
                    text: 'Sign In With Google',
                  ),
                  AppSpacing.v24(),
                  AppButton(
                    isLoading: provider.isGithubLoading,
                    onPressed: provider.signInWithGithub,
                    icon: AppIconData.github,
                    text: 'Sign In With Github',
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
