import 'package:eden/data/services/ably_service.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  OrderProvider({required AblyService ablyService})
      : _ablyService = ablyService;

  final AblyService _ablyService;

  void createAblyRealtimeInstance() {
    _ablyService.listenToChanges(
      onInitailized: (state) => debugPrint('Connection initialized'),
      onConnecting: (state) => debugPrint('Connection connecting'),
      onConnected: (state) => debugPrint('Connection connected'),
      onDisconnected: (state) => debugPrint('Connection disconnected'),
      onSuspended: (state) => debugPrint('Connection suspended'),
      onClosing: (state) => debugPrint('Connection closing'),
      onClosed: (state) => debugPrint('Connection closed'),
      onFailed: (state) => debugPrint('Connection failed'),
    );
  }

  void getOrderDetails() {
    _ablyService.listenToChannel('order-detail');
  }
}
