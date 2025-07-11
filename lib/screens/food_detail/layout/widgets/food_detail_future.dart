import 'package:flutter/material.dart';
import 'package:karsome/screens/food_detail/layout/widgets/food_app_bar.dart';
import 'package:karsome/screens/food_detail/layout/widgets/food_detail_body_future.dart';

class FoodDetailViewFuture extends StatelessWidget {
  final url;
  final productPrice;
  final productName;
  final productDescription;
  final category;

  const FoodDetailViewFuture(
      {super.key,
      required this.url,
      required this.productPrice,
      required this.productName,
      required this.productDescription,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodAppBar(context),
      body: FoodDetailBodyFuture(
        url: url,
        productPrice: productPrice,
        productName: productName,
        productDescription: productDescription,
        category: category,
      ),
    );
  }
}
