import 'package:flutter/material.dart';
import 'package:karsome/screens/customer/cart/cart_screen.dart';
import 'package:karsome/screens/food_detail/layout/widgets/cart_detail_view_body_future.dart';
import 'package:karsome/screens/food_detail/layout/widgets/food_app_bar.dart';

class CartDetailViewFuture extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const CartScreen());
  final url;
  final totalPrice;
  final totalCount;
  final productDescription;
  final productName;
  final specialRequest;
  final docId;

  const CartDetailViewFuture(
      {super.key,
      required this.url,
      required this.totalPrice,
      required this.productDescription,
      required this.totalCount,
      required this.specialRequest,
      required this.docId,
      required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodAppBar(context),
      body: CartDetailBodyFuture(
          url: url,
          docId: docId,
          totalPrice: totalPrice,
          productName: productName,
          specialRequest: specialRequest,
          totalCount: totalCount,
          productDescription: productDescription),
    );
  }
}
