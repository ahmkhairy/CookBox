import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:map_mvvm/viewmodel.dart';
import 'package:karsome/app/service_locator.dart';
import 'package:karsome/services/product/product_service.dart';

class DashboardViewModel extends Viewmodel {
  final ProductService _storageProduct = ProductService();

  Future<List<String>> getDashboardDetails() async {
    return await _storageProduct.getDashboardDetails();
  }

  Stream<QuerySnapshot> get status {
    return _storageProduct.status;
  }

  Future<bool> updateShopStatus(bool newStatus) async {
    return _storageProduct.updateShopStatus(newStatus);
  }
}
