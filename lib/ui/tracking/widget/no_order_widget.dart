import 'package:eden/shared/shared.dart';
import 'package:flutter/material.dart';

class NoOrderWidget extends StatelessWidget {
  const NoOrderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.6,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppIcons(
              icon: AppIconData.empty,
              size: 240,
            ),
            AppSpacing.v24(),
            Text(
              'You currently have no orders',
              style: AppTextStyle.regular16.copyWith(color: AppColors.grey500),
            ),
          ],
        ),
      ),
    );
  }
}
