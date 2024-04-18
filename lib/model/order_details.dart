class OrderDetails {
  final String orderId;
  final List<StatusDetails> statusHistory;
  final StatusDetails currentStatus;
  final DateTime orderDate;
  final String itemName;
  final int itemPrice;
  final int itemQuantity;

  OrderDetails({
    required this.orderId,
    required this.currentStatus,
    required this.orderDate,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    this.statusHistory = const [],
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      orderId: json['order_id'],
      currentStatus: StatusDetails.fromJson(json['order_status']),
      statusHistory: (json['order_status_history'] as List)
          .map((e) => StatusDetails.fromJson(e))
          .toList(),
      orderDate: DateTime.parse(json['order_date']),
      itemName: json['item_name'],
      itemPrice: json['item_price'],
      itemQuantity: json['item_quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'order_status': currentStatus.toJson(),
      'order_status_history': statusHistory.map((e) => e.toJson()).toList(),
      'order_date': orderDate.toIso8601String(),
      'item_name': itemName,
      'item_price': itemPrice,
      'item_quantity': itemQuantity,
    };
  }

  OrderDetails copyWith({
    String? orderId,
    StatusDetails? currentStatus,
    DateTime? orderDate,
    String? itemName,
    int? itemPrice,
    int? itemQuantity,
    List<StatusDetails>? statusHistory,
  }) {
    return OrderDetails(
      orderId: orderId ?? this.orderId,
      currentStatus: currentStatus ?? this.currentStatus,
      orderDate: orderDate ?? this.orderDate,
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      itemQuantity: itemQuantity ?? this.itemQuantity,
      statusHistory: statusHistory ?? this.statusHistory,
    );
  }
}

class StatusDetails {
  final String status;
  final DateTime date;
  StatusDetails({
    required this.status,
    required this.date,
  });

  factory StatusDetails.fromJson(Map<String, dynamic> json) {
    return StatusDetails(
      status: json['status'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'date': date.toIso8601String(),
    };
  }
}
