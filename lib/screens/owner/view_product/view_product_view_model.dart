import 'package:map_mvvm/viewmodel.dart';
import 'package:karsome/app/service_locator.dart';
import 'package:karsome/models/product.dart';
import 'package:karsome/services/product/product_service.dart';

class ViewProductViewModel extends Viewmodel {
  // AuthenticationService get _service => locator<AuthenticationService>();
  final ProductService _storageProduct = ProductService();

  Future<List<Product>> getAllProducts() async {
    return await _storageProduct.getProducts();
  }

  Future<List<Product>> getMainDishProducts() async {
    return await _storageProduct.getMainDishProducts();
  }

  Future<List<Product>> getDrinkProducts() async {
    return await _storageProduct.getDrinkProducts();
  }

  Future<List<Product>> getDessertProducts() async {
    return await _storageProduct.getDessertProducts();
  }

  void deleteProduct(String productID) async {
    await _storageProduct.deleteProduct(productID);
  }
}
