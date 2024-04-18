import 'package:eden/data/providers/auth_provider.dart';
import 'package:eden/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hi ${provider.currentUser?.displayName?.firstName ?? 'User'},',
              style: AppTextStyle.bold16.copyWith(
                fontSize: 28,
                color: AppColors.secondaryColor,
                fontWeight: AppFontWeight.black,
              ),
            ),
            AppImages(
              path: provider.currentUser?.photoURL ?? AppIconData.user,
              radius: 24,
              height: 32,
              width: 32,
            ),
          ],
        );
      },
    );
  }
}
