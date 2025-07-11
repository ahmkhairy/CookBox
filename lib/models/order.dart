import 'package:karsome/models/cart.dart';

enum Category { dineIn, pickup }

class OrderInfo {
  String? productName;
  String? productDescription;
  String? specialRequest;
  int? quantity;

  OrderInfo(
      {this.productName,
      this.productDescription,
      this.specialRequest,
      this.quantity});

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'productDescription': productDescription,
        'specialRequest': specialRequest,
        'quantity': quantity,
      };

  OrderInfo.fromJson(Map<dynamic, dynamic> json) {
    productName = json['productName'];
    productDescription = json['productDescription'];
    specialRequest = json['specialRequest'];
    quantity = json['quantity'];
  }

  OrderInfo.fromCartItem(CartItem item)
      : this(
            productDescription: item.productDescription,
            productName: item.productName,
            specialRequest: item.specialRequest,
            quantity: item.totalCount);
}

// freezed

class OrderPlaced {
  String orderId = "";
  String customerId = "";
  List<OrderInfo> itemList = [];
  double itemTotal = 0.0;
  double gst = 0.16;
  double deliveryCharge = 0.0;
  double total = 0.0;
  int totalCount = 0;
  DateTime orderTime = DateTime.now();
  String status = 'Pending';
  String type = "";

  OrderPlaced(
      {this.orderId = "",
      this.customerId = "",
      required this.itemList,
      this.itemTotal = 0.0,
      this.gst = 0.16,
      this.deliveryCharge = 0.0,
      this.total = 0.0,
      this.totalCount = 0,
      this.type = "",
      DateTime? orderTime,
      this.status = 'Pending'})
      : orderTime = orderTime ?? DateTime.now();

//!TODO retrieve the cartitem list from firebase
  OrderPlaced.fromJson(Map<dynamic, dynamic> json) {
    orderId = json['orderId'];
    //itemList = json['itemList'];
    customerId = json['customerId'];
    // itemList = json['orderInfo'];
    final List<dynamic> jsonList = json['orderInfo'];
    //!cast as List
    itemList = jsonList.map((json) => OrderInfo.fromJson(json)).toList();
    itemTotal = json['itemTotal'];
    gst = json['gst'];
    deliveryCharge = json['deliveryCharge'];
    total = json['total'];
    totalCount = json['totalCount'];
    // type = json['type'];
    orderTime = json['orderTime'].toDate();
    status = json['status'];
  }

  // OrderPlaced order;
  //

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['customerId'] = this.customerId;

  //   // data['itemList'] = this.itemList;
  //   //

  //   // final jsonList = json['orderInfo'];
  //   // itemList = jsonList.map((json) => OrderInfo.fromJson(json)).toList();
  //   //!
  //   //     List<Map> convertItemListToMap({required List<CartItem> itemList}) {
  //   //   List<Map> steps = [];
  //   //   itemList.forEach((CartItem item) {
  //   //     Map step = item.toJson();
  //   //     steps.add(step);
  //   //   });
  //   //   return steps;
  //   // }
  //   final _list = <Map<String, dynamic>>[];

  //   itemList.forEach((orderInfo) {
  //     _list.add(orderInfo.toJson());
  //   });

  //   // data['orderInfo'] = _list;

  //   data['itemTotal'] = this.itemTotal;
  //   data['gst'] = this.gst;
  //   data['deliveryCharge'] = this.deliveryCharge;
  //   data['total'] = this.total;
  //   data['totalCount'] = this.totalCount;
  //   data['orderTime'] = this.orderTime;
  //   data['status'] = this.status;
  //   data['type'] = this.type;
  //   return data;
  // }

//!TODO to be removed if not needed
  // List<Map> convertItemListToMap({required List<CartItem> itemList}) {
  //   List<Map> steps = [];
  //   itemList.forEach((CartItem item) {
  //     Map step = item.toJson();
  //     steps.add(step);
  //   });
  //   return steps;
  // }

  List<OrderInfo> get getOrders => itemList;
  String get getTotal => total.toString();

  // static List<Map> ConvertToMap({List<dynamic> order}) {
  //   List<Map> orderList = [];
  //   order.forEach((CartItem item) {
  //     Map step = customStep.toMap();
  //     steps.add(step);
  //   });
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'productName': this.productName,
  //     'totalPrice': this.totalPrice,
  //     'specialRequest': this.specialRequest,
  //     'totalCount': this.totalCount,
  //     'url': this.url,
  //   };
  // }
}
