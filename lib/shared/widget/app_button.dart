import 'package:eden/shared/app_colors.dart';
import 'package:eden/shared/app_spacing.dart';
import 'package:eden/shared/app_text_style.dart';
import 'package:eden/shared/widget/app_icons.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String icon;
  final bool isLoading;
  const AppButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
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
        child: isLoading
            ? const CircularProgressIndicator(color: AppColors.primaryColor)
            : Row(
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
