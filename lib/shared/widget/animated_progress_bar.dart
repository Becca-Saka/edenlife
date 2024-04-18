import 'package:eden/shared/app_colors.dart';
import 'package:eden/shared/widget/app_icons.dart';
import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatelessWidget {
  final double progress;
  const AnimatedProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width = width - 90;
    return TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        tween: Tween<double>(
          begin: progress == 1 ? 1 : 0,
          end: progress,
        ),
        builder: (context, value, _) {
          bool isComplete = value == 1;
          final position = width * value;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: LinearProgressIndicator(
                      value: value,
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  Positioned(
                    bottom: -6,
                    left: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: position == 0
                          ? AppColors.secondaryColor
                          : AppColors.primaryColor,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: -6,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: isComplete
                          ? AppColors.primaryColor
                          : AppColors.grey400,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: !isComplete ? -16 : -14,
                left: position - 24,
                child: CircleAvatar(
                    radius: !isComplete ? 18 : 16,
                    backgroundColor: AppColors.primaryColor,
                    child: AppIcons(
                      icon: !isComplete ? AppIconData.bus : AppIconData.check,
                      color: Colors.white,
                      size: !isComplete ? 18 : 28,
                    )),
              ),
            ],
          );
        });
  }
}
