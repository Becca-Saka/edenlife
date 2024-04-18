import 'package:eden/data/providers/order_provider.dart';
import 'package:eden/shared/app_colors.dart';
import 'package:eden/shared/app_spacing.dart';
import 'package:eden/shared/app_text_style.dart';
import 'package:eden/shared/widget/order_card_widget.dart';
import 'package:eden/shared/widget/view_slider.dart';
import 'package:eden/ui/tracking/tracking_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false)
        .createAblyRealtimeInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Colors.grey[100]!,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.v16(),
                Text(
                  'Hi Rahul',
                  style: AppTextStyle.bold16.copyWith(
                    fontSize: 28,
                    color: AppColors.primaryColor,
                    fontWeight: AppFontWeight.black,
                  ),
                ),
                const AppSpacing(v: 4),
                Text(
                  'Here are your orders',
                  style: AppTextStyle.semibold18
                      .copyWith(color: AppColors.grey500),
                ),
                const AppSpacing(v: 16),
                Text(
                  'Current Orders (${provider.orderDetails.length})',
                  style: AppTextStyle.bold20.copyWith(
                    fontSize: 16,
                    color: AppColors.secondaryColor,
                    fontWeight: AppFontWeight.black,
                  ),
                ),
                AppSpacing.v16(),
                if (provider.orderDetails.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: provider.orderDetails.length,
                    itemBuilder: (context, index) {
                      final orderDetails = provider.orderDetails[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: ViewSlidingWidget(
                          child: OrderCard(
                            orderDetails: orderDetails,
                            statuses: provider.statusList,
                            onTap: () {
                              provider.selectOrder(index);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const TrackingDetailsView();
                              }));
                            },
                          ),
                        ),
                      );
                    },
                  ),
                const AppSpacing(v: 8),
              ],
            ),
          ),
        ),
      );
    });
  }
}
