import 'package:eden/model/order_details.dart';
import 'package:eden/shared/app_colors.dart';
import 'package:eden/shared/app_spacing.dart';
import 'package:eden/shared/app_text_style.dart';
import 'package:eden/shared/extension/string.dart';
import 'package:eden/shared/widget/animated_progress_bar.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final OrderDetails orderDetails;
  final List<String> statuses;
  final VoidCallback? onTap;
  const OrderCard({
    super.key,
    required this.orderDetails,
    required this.statuses,
    this.onTap,
  });
  double get _getProgress {
    final statusIndex = statuses.indexOf(orderDetails.currentStatus.status) + 1;
    double progress = statusIndex / statuses.length;
    if (progress > 1) {
      progress = 1;
    }
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#${orderDetails.orderId}',
                      style: AppTextStyle.bold14.copyWith(
                        color: AppColors.grey400,
                      ),
                    ),
                    if (onTap == null)
                      Hero(
                          tag: orderDetails.orderId,
                          child: const Icon(Icons.keyboard_arrow_down_rounded))
                  ],
                ),
                const AppSpacing(v: 4),
                Text(
                  orderDetails.itemName,
                  style: AppTextStyle.bold18.copyWith(
                    color: AppColors.secondaryColor,
                    fontWeight: AppFontWeight.black,
                  ),
                ),
                const AppSpacing(v: 1),
                Text(
                  '${orderDetails.itemQuantity} x NGN ${orderDetails.itemPrice}',
                  style: AppTextStyle.regular14.copyWith(
                    color: AppColors.grey400,
                  ),
                ),
                AppSpacing.v24(),
                AnimatedProgressBar(
                  progress: _getProgress,
                ),
                AppSpacing.v24(),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Status: ',
                      style: AppTextStyle.bold14.copyWith(
                        color: AppColors.grey400,
                      ),
                    ),
                    TextSpan(
                      text: orderDetails.currentStatus.status.toTitleCase(),
                      style: AppTextStyle.bold14.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          AppSpacing.v8(),
          if (onTap != null) const Divider(height: 1),
          if (onTap != null)
            SizedBox(
              width: double.infinity,
              height: 56,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                ),
                onPressed: onTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Track Order',
                      style: AppTextStyle.bold16.copyWith(
                        color: AppColors.grey500,
                      ),
                    ),
                    AppSpacing.h8(),
                    Hero(
                      tag: orderDetails.orderId,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
