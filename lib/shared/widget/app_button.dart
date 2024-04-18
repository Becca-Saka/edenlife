// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eden/shared/app_spacing.dart';
import 'package:eden/shared/app_text_style.dart';
import 'package:eden/shared/widget/app_icons.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String icon;
  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons(
              icon: icon,
            ),
            AppSpacing.h8(),
            Text(
              text,
              style: AppTextStyle.regular16,
            ),
          ],
        ),
      ),
    );
  }
}
