import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:karsome/infrastructure/models/add_to_cart.dart';
import 'package:karsome/models/cart.dart';
import 'package:karsome/models/order.dart';
import 'package:karsome/models/product.dart';
import 'package:karsome/models/rating.dart';

class ProductService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future insertProduct(Map<String, dynamic> item) async {
    try {
      await _store.collection('allProducts').doc(item["productName"]).set(item);
    } catch (e) {}
  }

  Future deleteProduct(String productID) async {
    try {
      _store.collection('allProducts').doc(productID).delete();
    } catch (e) {}
  }

  Future<List<Product>> getProducts() async {
    QuerySnapshot products = await _store.collection('allProducts').get();
    List<Product> productList = [];
    for (int i = 0; i < products.docs.length; i++) {
      dynamic singleProduct = products.docs[i].data();
      Product currentProduct = Product.fromJson(singleProduct);
      productList.add(currentProduct);
    }

    return productList;
  }

  Future<List<Product>> getMainDishProducts() async {
    QuerySnapshot products = await _store.collection('allProducts').get();
    List<Product> productList = [];
    for (int i = 0; i < products.docs.length; i++) {
      dynamic singleProduct = products.docs[i].data();
      Product currentProduct = Product.fromJson(singleProduct);
      if (currentProduct.category == "Food") {
        productList.add(currentProduct);
      }
    }

    return productList;
  }

  Future<List<Product>> getDrinkProducts() async {
    QuerySnapshot products = await _store.collection('allProducts').get();
    List<Product> productList = [];
    for (int i = 0; i < products.docs.length; i++) {
      dynamic singleProduct = products.docs[i].data();
      Product currentProduct = Product.fromJson(singleProduct);
      if (currentProduct.category == "Drinks") {
        productList.add(currentProduct);
      }
    }

    return productList;
  }

  Future<List<Product>> getDessertProducts() async {
    QuerySnapshot products = await _store.collection('allProducts').get();
    List<Product> productList = [];
    for (int i = 0; i < products.docs.length; i++) {
      dynamic singleProduct = products.docs[i].data();
      Product currentProduct = Product.fromJson(singleProduct);
      if (currentProduct.category == "Desserts") {
        productList.add(currentProduct);
      }
    }

    return productList;
  }

  Future<String> uploadFileToStorage(String destination, File file) async {
    final ref = _storage.ref(destination);

    final task = ref.putFile(file);
    final snapshot = await task.whenComplete(() {});
    final photUrl = await snapshot.ref.getDownloadURL();
    return photUrl;
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

//the following method clears the cart and should be called when an order is submitted
  Future<bool> clearCart() async {
    String user = _auth.currentUser!.uid;
    try {
      var collection = _store.collection('users').doc(user).collection('Cart');
      var snapshots = await collection.get();
      for (var doc in snapshots.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      return false;
    }

    return true;
  }

  Future<List<CartItem>> getCartItems() async {
    String user = _auth.currentUser!.uid;
    List<CartItem> cartList = [];

    QuerySnapshot cartItem =
        await _store.collection('users').doc(user).collection('Cart').get();

    for (int i = 0; i < cartItem.docs.length; i++) {
      dynamic singleCartItem = cartItem.docs[i].data();

      CartItem currentProduct = CartItem.fromJson(singleCartItem);

      cartList.add(currentProduct);
    }

    return cartList;
  }

  Future deleteCartItem(String docId) async {
    try {
      String userid = _auth.currentUser!.uid;
      _store
          .collection('users')
          .doc(userid)
          .collection('Cart')
          .doc(docId)
          .delete();
    } catch (e) {}
  }

  Future<Product> getProductInfo(productID) async {
    CollectionReference allProducts = _store.collection('allProducts');
    DocumentSnapshot snapshot = await allProducts.doc(productID).get();

    var data = snapshot.data() as Map;
    Product currentProduct = Product.fromJson(data);

    return currentProduct;
  }

  Future<void> updateProductInfo(productID, product) async {
    CollectionReference allProducts = _store.collection('allProducts');

    //This deletes the old document and adds the new one.
    //This should hopefully not present issues, however if it does, the way to fix it
    //Is to use a special productID to manuver data in the products DB and NOT the product name.
    //This should be done in the future regardless.

    allProducts.doc(product['productName']).set(product);
    allProducts.doc(productID).delete();
  }

  Future<List<OrderPlaced>> getOrders(String orderStatus) async {
  QuerySnapshot snapshot = await _store.collection('order').get();
  List<OrderPlaced> orderList = [];

  for (var doc in snapshot.docs) {
    try {
      print("Loaded ${orderList.length} orders with status: $orderStatus");
      final data = doc.data() as Map<String, dynamic>;
      final order = OrderPlaced.fromJson(data);
      if (order.status == orderStatus) {
        orderList.add(order);
      }
    } catch (e) {
      print('Error parsing order: $e');
    }
  }

  return orderList;
}


  Future<List<OrderInfo>> getOrderInfo() async {
    QuerySnapshot orders = await _store.collection('order').get();
    List<OrderInfo> orderInfoList = [];
    // List<dynamic> result =  snapshot.docs.map((doc) => doc.data()).toList();
    for (int i = 0; i < orders.docs.length; i++) {
      dynamic singleOrder = orders.docs[i].data();
      OrderInfo currentOrder = OrderInfo.fromJson(singleOrder.itemList);
      orderInfoList.add(currentOrder);
    }
    return orderInfoList;
  }

  Future submitOrder(OrderPlaced order) async {
    dynamic thelist = order.itemList;

    String userid = _auth.currentUser!.uid;
    DocumentReference docRef = _store.collection('order').doc();
    List<Map> allOrderDetails = [];

    for (var element in order.itemList) {
      allOrderDetails.add(element.toJson());
      // for (int i = 0; i < (order.totalCount / 2); i++) {
      //   allOrderDetails.add(element.toJson());
      // }
    }

    allOrderDetails.removeRange(0, order.totalCount);
    return await docRef.set({
      'orderId': docRef.id,
      'customerId': userid,
      'orderTime': DateTime.now(),
      // 'orderInfo': FieldValue.arrayUnion(order.itemList),
      'orderInfo': allOrderDetails,
      'itemTotal': order.itemTotal,
      'total': order.total,
      'totalCount': order.totalCount,
      'gst': order.gst,
      'deliveryCharge': order.deliveryCharge,
      'status': 'Pending',
    });
  }

  Future<List<OrderPlaced>> getOrderHistory(String type) async {
    String userid = _auth.currentUser!.uid;
    List<OrderPlaced> userOrder = [];
    List<QueryDocumentSnapshot> matchingOrders = [];
    await _store
        .collection('order')
        .where('customerId', isEqualTo: userid)
        .get()
        .then((value) {
      for (var element in value.docs) {
        matchingOrders.add(element);
        for (int i = 0; i < matchingOrders.length; i++) {
          dynamic singleOrder = matchingOrders[i].data();
          OrderPlaced currentItem = OrderPlaced.fromJson(singleOrder);
          if (currentItem.status == type) {
            userOrder.add(currentItem);
          }
        }
      }
    });
    return userOrder;
  }

  Future<List<String>> getDashboardDetails() async {
    QuerySnapshot orders = await _store.collection('order').get();
    QuerySnapshot ratings = await _store.collection('rating').get();

    double total = 0.0;
    int pendingOrders = 0;
    int liked = 0;
    double rating = 0.0;
    List<String> dashboardData = ["0.0", "0", "0.0"];

    //total
    for (int i = 0; i < orders.docs.length; i++) {
      dynamic singleOrder = orders.docs[i].data();
      OrderPlaced currentOrder = OrderPlaced.fromJson(singleOrder);
      if (currentOrder.status == "Completed") {
        total += currentOrder.total;
      }
    }
    //pending
    for (int i = 0; i < orders.docs.length; i++) {
      dynamic singleOrder = orders.docs[i].data();
      OrderPlaced currentOrder = OrderPlaced.fromJson(singleOrder);
      if (currentOrder.status == 'Pending') {
        pendingOrders += 1;
      }
    }
    //rating
    for (int i = 0; i < ratings.docs.length; i++) {
      dynamic singleFeedback = ratings.docs[i].data();
      Rating currentRating = Rating.fromJson(singleFeedback);
      if (currentRating.rating == "Like") {
        liked += 1;
      }
    }
    rating = (liked / ratings.docs.length) * 100;

    dashboardData[0] = total.toString();
    dashboardData[1] = pendingOrders.toString();
    dashboardData[2] = rating.toStringAsFixed(2);
    return dashboardData;
  }

  Future<bool> submitRating(Rating feedback) async {
    try {
      DocumentReference docRef = _store.collection('rating').doc();
      await docRef.set(feedback.toJson());
      return true;
    } on FirebaseException {
      return false;
    }
  }

  Future<void> updateOrderStatus(orderId, status) async {
    CollectionReference allOrders = _store.collection('order');

    allOrders.doc(orderId).update({'status': status});
  }

  Stream<QuerySnapshot> get status {
    final CollectionReference shopCollection = _store.collection('shopStatus');

    return shopCollection.snapshots();
  }

  bool updateShopStatus(bool newStatus) {
    final CollectionReference shopCollection = _store.collection('shopStatus');
    try {
      shopCollection.doc('2styuraHe9T4vNQWrzd7').update({'isOpen': newStatus});
      return newStatus;
    } on FirebaseException {}
    return false;
  }

  bool getShopStatus() {
    final DocumentReference shopCollection =
        _store.collection('shopStatus').doc();
    bool status;
    try {
      final statusSnapShot = shopCollection.get().then((DocumentSnapshot doc) {
        status = doc.data() as bool;
        return status;
      });
    } on FirebaseException {}
    return false;
  }
}
