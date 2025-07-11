import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karsome/infrastructure/models/add_to_cart.dart';
import 'package:karsome/infrastructure/models/dessert_model.dart';
import 'package:karsome/infrastructure/models/food_model.dart';

import '../models/drink_model.dart';

class ProductServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///create post
  Future addToCart({
    required AddToCartModel addToCartModel,
  }) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('addToCart').doc();
    return await docRef.set(addToCartModel.toJson(
      docRef.id,
    ));
  }

  ///create foodPost
  Stream<List<FoodModel>> streamFoodPost() {
    return FirebaseFirestore.instance
        .collection('products')
        .doc("Food")
        .collection('food')
        .snapshots()
        .map(
          (data) => data.docs.map((e) => FoodModel.fromJson(e.data())).toList(),
        );
  }

  ///create DrinkPost
  Stream<List<DrinkModel>> streamDrinkPost() {
    return FirebaseFirestore.instance
        .collection('products')
        .doc("Drinks")
        .collection('drinks')
        .snapshots()
        .map(
          (data) =>
              data.docs.map((e) => DrinkModel.fromJson(e.data())).toList(),
        );
  }

  Stream<List<DessertModel>> streamDessertPost() {
    return FirebaseFirestore.instance
        .collection('products')
        .doc("Desserts")
        .collection('desserts')
        .snapshots()
        .map(
          (data) =>
              data.docs.map((e) => DessertModel.fromJson(e.data())).toList(),
        );
  }

  Future addToCartFuture({
    required AddToCartModel addToCartModel,
  }) async {
    String userid = _auth.currentUser!.uid;
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userid)
        .collection('Cart')
        .doc();
    return await docRef.set(addToCartModel.toJson(
      docRef.id,
    ));
  }
}
