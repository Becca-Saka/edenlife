import 'package:collection/collection.dart';
import 'package:eden/data/providers/order_provider.dart';
import 'package:eden/shared/app_colors.dart';
import 'package:eden/shared/app_spacing.dart';
import 'package:eden/shared/app_text_style.dart';
import 'package:eden/shared/extension/datetime.dart';
import 'package:eden/shared/extension/string.dart';
import 'package:eden/shared/widget/order_card_widget.dart';
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
                          color: AppColors.primaryColor,
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
                            theme: TimelineThemeData(
                                color: AppColors.secondaryColor,
                                indicatorTheme:
                                    const IndicatorThemeData(size: 15),
                                connectorTheme:
                                    const ConnectorThemeData(thickness: 4)),
                            builder: TimelineTileBuilder.connected(
                              connectionDirection: ConnectionDirection.after,
                              indicatorBuilder: (_, index) {
                                if (index <= order.statusHistory.length - 1) {
                                  return const DotIndicator(
                                    color: AppColors.secondaryColor,
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
                                          color: AppColors.secondaryColor)
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
                                return Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Text(
                                    status.toTitleCase(),
                                    style: AppTextStyle.bold14,
                                  ),
                                );
                              },
                              oppositeContentsBuilder: (context, index) {
                                final status = provider.statusList[index];
                                final statusHistory = order.statusHistory
                                    .firstWhereOrNull(
                                        (element) => element.status == status);
                                return Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Text(
                                    statusHistory != null
                                        ? statusHistory.date.timeOnly
                                        : 'Awaiting status',
                                    style: AppTextStyle.bold12.copyWith(
                                      color: statusHistory != null
                                          ? Colors.black
                                          : AppColors.grey400,
                                    ),
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
