import 'package:eden/shared/app_colors.dart';
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
          final position = width * value;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Stack(
                // alignment: Alignment.centerLeft,
                clipBehavior: Clip.none,
                // alignment: Alignment.bottomCenter,
                children: [
                  // const AppSpacing(h: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: LinearProgressIndicator(
                      value: value,
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  Positioned(
                    bottom: -8,
                    left: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: position == 0
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: -8,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: value == 1
                          ? AppColors.secondaryColor
                          : AppColors.grey400,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: -18,
                left: position - 30,
                child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.secondaryColor,
                    child: Icon(
                      value != 1 ? Icons.fire_truck : Icons.check,
                      color: Colors.white,
                    )),
              ),
            ],
          );
        });
  }
}
