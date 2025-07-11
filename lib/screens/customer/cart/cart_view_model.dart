import 'package:map_mvvm/viewmodel.dart';
import 'package:karsome/app/service_locator.dart';
import 'package:karsome/models/cart.dart';
import 'package:karsome/services/product/product_service.dart';

class CartViewModel extends Viewmodel {
  final ProductService _storageProduct = ProductService();

  Future<List<CartItem>> getCartitems() async {
    return await _storageProduct.getCartItems();
  }

  Future<bool> clearCart() async {
    return await _storageProduct.clearCart();
  }

  void deleteCartItem(String docID) async {
    await _storageProduct.deleteCartItem(docID);
  }
}
