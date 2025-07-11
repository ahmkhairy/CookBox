import 'package:map_mvvm/viewmodel.dart';
import 'package:karsome/app/service_locator.dart';
import 'package:karsome/models/cart.dart';
import 'package:karsome/models/order.dart';
import 'package:karsome/services/product/product_service.dart';

class OrderViewModel extends Viewmodel {
  List<OrderPlaced> orderList = [];
  CartItem cartItem = CartItem(
      productName: "",
      totalPrice: 0.0,
      specialRequest: "",
      productDescription: "",
      totalCount: 0,
      url: "");

  final ProductService _storageProduct = ProductService();
//returns all orders based on status passed (completed,pending,rejected)
  Future<List<OrderPlaced>> getOrders(String status) async {
    return await _storageProduct.getOrders(status);
  }

//returns the total for completed orders
  Future<List<OrderPlaced>> getOrdersTotal() async {
    return await _storageProduct.getOrders("status");
  }

  Future submitOrder(
      List<CartItem> cartItems,
      double itemTotal,
      double deliveryCharge,
      double gst,
      double total,
      int count,
      String type) async {
    // List<Map> list = cartItem.convertItemListToMap(itemList: order).toList();

    final orderInfos =
        cartItems.map((item) => OrderInfo.fromCartItem(item)).toList();

    OrderPlaced newOrder = OrderPlaced(
        itemList: orderInfos,
        itemTotal: itemTotal,
        gst: gst,
        deliveryCharge: deliveryCharge,
        total: total,
        totalCount: count,
        type: type);

    return await _storageProduct.submitOrder(newOrder);
  }

  Future<List<String>> getDashboardDetails() async {
    return await _storageProduct.getDashboardDetails();
  }

  Future<void> changeOrderStatus(orderId, status) async {
    try {
      _storageProduct.updateOrderStatus(orderId, status);
    } catch (e) {}
  }
}
