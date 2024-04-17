import 'package:eden/data/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: provider.createAblyRealtimeInstance,
                child: const Text('Init Data'),
              ),
              ElevatedButton(
                onPressed: provider.getOrderDetails,
                child: const Text('Get Data'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
