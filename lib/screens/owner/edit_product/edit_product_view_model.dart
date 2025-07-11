import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_mvvm/viewmodel.dart';
import 'package:karsome/app/service_locator.dart';
import 'package:karsome/services/product/product_service.dart';
import 'package:path/path.dart';

class EditProductViewModel extends Viewmodel {
  final ProductService _storageService = ProductService();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  File? cameraImage;
  File? storageImage;

  addProduct(String productName, double productPrice, String productDescription,
      String category, String url) {
    Map<String, dynamic> data = {
      "productName": productName,
      "productPrice": productPrice,
      "productDescription": productDescription,
      'category': category,
      'url': url,
    };
    try {
      _storageService.insertProduct(data);
    } catch (e) {}
  }

  Future<File?> selectImageStorage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final temp = File(image.path);
      storageImage = temp;
      return storageImage;
    } on PlatformException {}
    return null;
  }

  Future selectImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final temp = File(image.path);
      cameraImage = temp;
      return cameraImage;
    } on PlatformException {}
  }

  Future uploadImage(File? file) async {
    try {
      String filePath = basename(file!.path);
      final destination = 'productImages/$filePath';

      return await _storageService.uploadFileToStorage(destination, file);
    } catch (e) {}
  }

  Future getProductInfo(String productID) async {
    return _storageService.getProductInfo(productID);
  }

  updateProduct(String oldProductID, String productName, double productPrice,
      String productDescription, String category, String url) {
    Map<String, dynamic> data = {
      "productName": productName,
      "productPrice": productPrice,
      "productDescription": productDescription,
      'category': category,
      'url': url,
    };
    try {
      _storageService.updateProductInfo(oldProductID, data);
    } catch (e) {}
  }
}
