import 'package:map_mvvm/map_mvvm.dart';
import 'package:karsome/app/app.dart';
import 'package:karsome/models/order.dart';
import 'package:karsome/models/rating.dart';
import 'package:karsome/models/user.dart';
import 'package:karsome/services/product/product_service.dart';
import 'package:karsome/services/user/user_service.dart';

class OrderHistoryViewModel extends Viewmodel {
  final ProductService _storageProduct = ProductService();
  final UserService _userService = UserService();

  Future<List<OrderPlaced>> getpreviousOrders(String type) async {
    return await _storageProduct.getOrderHistory(type);
  }

  Future<bool> submitRating(String orderId, String rating) async {
    Rating feedback = Rating(orderId: orderId, rating: rating);
    return await _storageProduct.submitRating(feedback);
  }

  Future<SystemUser> getUserInfo() async {
    return await _userService.getUserInfo();
  }
}
