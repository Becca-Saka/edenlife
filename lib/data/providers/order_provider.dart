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
  bool loading = false;
  StatusDetails get status => StatusDetails(
        status: 'ORDER PLACED',
        date: DateTime.now(),
      );
  List<OrderDetails> get initialData => [
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
  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void initialize() {
    loading = true;
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

        setLoading(false);
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
    fakeTimeOut();
  }

  Future<void> fakeTimeOut() async {
    await Future.delayed(const Duration(seconds: 5), () {
      setLoading(false);
    });
  }

  void getOrderStatusList() {
    _ablyService.listenToChannel(
      channelName: 'order-status',
      onMessage: (message) {
        debugPrint('Message received: ${message.data}');
        setLoading(false);
        if (message.data != null) {
          final data = jsonDecode(message.data as String) as List;
          statusList = data.map((e) => e as String).toList();
          notifyListeners();
        }
      },
    );
  }

  void getStatusUpdates() {
    _ablyService.listenToChannel(
      channelName: 'update-status',
      onMessage: (message) {
        debugPrint('Message received: ${message.data}');
        setLoading(false);
        if (message.data != null) {
          final data = jsonDecode(message.data as String) as Map;

          final index = orderDetails
              .indexWhere((element) => element.orderId == data['order_id']);
          if (index != -1) {
            orderDetails[index] = orderDetails[index].copyWith(
              currentStatus: StatusDetails.fromJson(data['order_status']),
              statusHistory: [
                ...orderDetails[index].statusHistory,
                StatusDetails.fromJson(data['order_status']),
              ],
            );
            notifyListeners();
          }
        }
      },
    );
  }

  void selectOrder(int orderIndex) {
    selectedOrderIndex = orderIndex;
  }

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

  void sendFakeData() {
    sendOrderDetails();
    sendOrderStatusList();
    simulateStatusUpdates();
  }

  void sendOrderDetails() {
    _ablyService.publishMessage(
      'order-detail',
      jsonEncode(initialData.map((e) => e.toJson()).toList()),
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
}
