import 'package:eden/model/order_details.dart';
import 'package:eden/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    double progress = 0;

    if (statuses.isNotEmpty) {
      final statusIndex =
          statuses.indexOf(orderDetails.currentStatus.status) + 1;
      if (statusIndex != -1) {
        progress = statusIndex / statuses.length;
      }
    }
    if (progress > 1) {
      progress = 1;
    }
    if (progress < 0) {
      progress = 0;
    }
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            spreadRadius: 1.4,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
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
                const AppSpacing(v: 12),
                Text(
                  orderDetails.itemName,
                  style: AppTextStyle.bold18,
                ),
                const AppSpacing(v: 4),
                Text(
                  '${orderDetails.itemQuantity} x NGN ${orderDetails.itemPrice}',
                  style: AppTextStyle.regular14.copyWith(
                    color: AppColors.grey400,
                  ),
                ),
                AppSpacing.v24(),
                Skeleton.ignore(
                  child: AnimatedProgressBar(
                    progress: _getProgress,
                  ),
                ),
                AppSpacing.v24(),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Status: ',
                      style: AppTextStyle.semibold14.copyWith(
                        color: AppColors.grey400,
                      ),
                    ),
                    TextSpan(
                      text: orderDetails.currentStatus.status.toTitleCase(),
                      style: AppTextStyle.semibold14.copyWith(
                        color: AppColors.grey400,
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
                        color: AppColors.primaryColor,
                      ),
                    ),
                    AppSpacing.h8(),
                    Hero(
                      tag: orderDetails.orderId,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppColors.primaryColor,
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
