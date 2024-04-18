import 'package:eden/data/providers/order_provider.dart';
import 'package:eden/shared/shared.dart';
import 'package:eden/ui/tracking/tracking_details_view.dart';
import 'package:eden/ui/tracking/widget/no_order_widget.dart';
import 'package:eden/ui/tracking/widget/order_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'widget/greetings_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, _) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.v16(),
                  const GreetingsWidget(),
                  const AppSpacing(v: 4),
                  Text(
                    'Here are your orders',
                    style: AppTextStyle.medium16
                        .copyWith(color: AppColors.grey500),
                  ),
                  AppSpacing.v16(),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Orders (${provider.orderDetails.length})',
                          style: AppTextStyle.bold14.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        AppSpacing.v8(),
                        if (provider.loading)
                          Skeletonizer(
                            enabled: provider.loading,
                            child: OrderCard(
                              orderDetails: provider.initialData.first,
                              statuses: provider.statusList,
                            ),
                          )
                        else if (provider.orderDetails.isEmpty)
                          const NoOrderWidget()
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.orderDetails.length,
                            itemBuilder: (context, index) {
                              final orderDetails = provider.orderDetails[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: ViewSlidingWidget(
                                  wait: index + 1,
                                  child: OrderCard(
                                    orderDetails: orderDetails,
                                    statuses: provider.statusList,
                                    onTap: () {
                                      provider.selectOrder(index);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
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
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
