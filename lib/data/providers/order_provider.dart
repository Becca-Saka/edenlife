import 'dart:async';
import 'dart:convert';

import 'package:eden/data/services/ably_service.dart';
import 'package:eden/model/order_details.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  OrderProvider({required AblyService ablyService})
      : _ablyService = ablyService;

  final AblyService _ablyService;

  List<OrderDetails> orderDetails = [];
  List<String> statusList = [];
  int? selectedOrderIndex;
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
    subscribeToChannels();
    sendFakeData();
  }

  void getOrderDetails() {
    _ablyService.listenToChannel(
      channelName: 'order-detail',
      onMessage: (message) {
        debugPrint('Message received: ${message.data}');

        if (message.data != null) {
          final data = jsonDecode(message.data as String) as List;
          orderDetails = data
              .map((e) => OrderDetails.fromJson(e as Map<String, dynamic>))
              .toList();
          notifyListeners();
        }
      },
    );
  }

  void subscribeToChannels() {
    getOrderDetails();
    getOrderStatusList();
    getStatusUpdates();
  }

  void sendFakeData() {
    sendOrderDetails();
    sendOrderStatusList();
    simulateStatusUpdates();
  }

  void sendOrderDetails() {
    final status = StatusDetails(
      status: 'ORDER PLACED',
      date: DateTime.now(),
    );
    final orderDetail = [
      OrderDetails(
        orderId: '123',
        currentStatus: status,
        statusHistory: [status],
        orderDate: DateTime.now(),
        itemName: 'Spicy Fried Rice',
        itemPrice: 1000,
        itemQuantity: 1,
      ),
      OrderDetails(
        orderId: '125',
        currentStatus: status,
        statusHistory: [status],
        orderDate: DateTime.now(),
        itemName: 'Asaro with Vegetables',
        itemPrice: 5000,
        itemQuantity: 10,
      ),
    ];
    _ablyService.publishMessage(
      'order-detail',
      jsonEncode(orderDetail.map((e) => e.toJson()).toList()),
    );
  }

  void sendOrderStatusList() {
    final statusList = [
      'ORDER PLACED',
      'ORDER ACCEPTED',
      'ORDER PICK UP IN PROGRESS',
      'ORDER ON THE WAY TO CUSTOMER',
      'ORDER ARRIVED',
      'ORDER DELIVERED',
    ];
    _ablyService.publishMessage(
      'order-status',
      jsonEncode(statusList),
    );
  }

  void getOrderStatusList() {
    _ablyService.listenToChannel(
      channelName: 'order-status',
      onMessage: (message) {
        debugPrint('Message received: ${message.data}');
        if (message.data != null) {
          final data = jsonDecode(message.data as String) as List;
          statusList = data.map((e) => e as String).toList();
          notifyListeners();
        }
      },
    );
  }

// {
//   'order_id':'123',
//   'order_status':'ORDER PLACED',
// }

  void updateStatus(String orderId, String orderStatus) {
    _ablyService.publishMessage(
      'update-status',
      jsonEncode({
        'order_id': orderId,
        'order_status': {
          'status': orderStatus,
          'date': DateTime.now().toIso8601String(),
        },
      }),
    );
  }

  Future<void> simulateStatusUpdates() async {
    await Future.delayed(const Duration(seconds: 3));
    getStaus('123');
    // await Future.delayed(const Duration(seconds: 6));
    // getStaus('125');
  }

  void getStaus(String orderId) {
    int index = 1;
    Timer.periodic(const Duration(seconds: 5), (timer) {
      updateStatus(orderId, statusList[index]);
      index++;
      if (index == statusList.length) {
        timer.cancel();
      }
    });
  }

  void getStatusUpdates() {
    _ablyService.listenToChannel(
      channelName: 'update-status',
      onMessage: (message) {
        debugPrint('Message received: ${message.data}');
        if (message.data != null) {
          final data = jsonDecode(message.data as String) as Map;

          final index = orderDetails
              .indexWhere((element) => element.orderId == data['order_id']);
          orderDetails[index] = orderDetails[index].copyWith(
            currentStatus: StatusDetails.fromJson(data['order_status']),
            statusHistory: [
              ...orderDetails[index].statusHistory,
              StatusDetails.fromJson(data['order_status']),
            ],
          );
          notifyListeners();
        }
      },
    );
  }

  void selectOrder(int orderIndex) {
    selectedOrderIndex = orderIndex;
  }
}
