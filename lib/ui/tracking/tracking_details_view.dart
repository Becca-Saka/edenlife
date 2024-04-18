import 'package:collection/collection.dart';
import 'package:eden/data/providers/order_provider.dart';
import 'package:eden/shared/shared.dart';
import 'package:eden/ui/tracking/widget/order_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

class TrackingDetailsView extends StatelessWidget {
  const TrackingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, _) {
      final order = provider.orderDetails[provider.selectedOrderIndex!];

      return Scaffold(
        backgroundColor: Colors.grey[100]!,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      Text(
                        'Tracking',
                        style: AppTextStyle.bold16.copyWith(
                          fontSize: 28,
                          color: AppColors.secondaryColor,
                          fontWeight: AppFontWeight.black,
                        ),
                      ),
                      const AppSpacing(v: 20),
                      Card(
                        elevation: 0.1,
                        child: OrderCard(
                          orderDetails: order,
                          statuses: provider.statusList,
                        ),
                      ),
                      const AppSpacing(v: 2),
                      Card(
                        elevation: 0.1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FixedTimeline.tileBuilder(
                            mainAxisSize: MainAxisSize.min,
                            theme: TimelineThemeData(
                                color: AppColors.primaryColor,
                                indicatorTheme:
                                    const IndicatorThemeData(size: 15),
                                connectorTheme: const ConnectorThemeData(
                                  thickness: 4,
                                  space: 10,
                                )),
                            builder: TimelineTileBuilder.connected(
                              connectionDirection: ConnectionDirection.before,
                              indicatorBuilder: (_, index) {
                                if (index <= order.statusHistory.length - 1) {
                                  return const DotIndicator(
                                    color: AppColors.primaryColor,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 12.0,
                                    ),
                                  );
                                } else {
                                  return const OutlinedDotIndicator(
                                    borderWidth: 2.5,
                                    color: AppColors.grey400,
                                  );
                                }
                              },
                              connectorBuilder: (_, index, ___) =>
                                  index <= order.statusHistory.length - 1
                                      ? const SolidLineConnector(
                                          color: AppColors.primaryColor)
                                      : const DashedLineConnector(
                                          color: AppColors.grey400),
                              contentsAlign: ContentsAlign.basic,
                              indicatorPositionBuilder: (context, index) {
                                return index == 0
                                    ? 0.5
                                    : index == provider.statusList.length - 1
                                        ? 0.5
                                        : 0.5;
                              },
                              contentsBuilder: (context, index) {
                                final status = provider.statusList[index];
                                final statusHistory = order.statusHistory
                                    .firstWhereOrNull(
                                        (element) => element.status == status);
                                return Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Text(
                                    status.toTitleCase(),
                                    style: statusHistory != null
                                        ? AppTextStyle.bold14
                                        : AppTextStyle.medium14
                                            .copyWith(color: AppColors.grey400),
                                  ),
                                );
                              },
                              oppositeContentsBuilder: (context, index) {
                                final status = provider.statusList[index];
                                final statusHistory = order.statusHistory
                                    .firstWhereOrNull(
                                        (element) => element.status == status);
                                if (statusHistory == null) {
                                  return const SizedBox.shrink();
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Text(
                                    statusHistory.date.timeOnly,
                                    style: AppTextStyle.bold12,
                                  ),
                                );
                              },
                              itemCount: provider.statusList.length,
                            ),
                          ),
                        ),
                      ),
                      const AppSpacing(v: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
