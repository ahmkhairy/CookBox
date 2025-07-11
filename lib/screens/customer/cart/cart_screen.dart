import 'package:flutter/material.dart';
import 'package:karsome/screens/customer/cart/cart_app_bar.dart';
import 'package:karsome/screens/customer/cart/cart_body.dart';

class CartScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const CartScreen());
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CartAppBar(),
      body: CartPage(),
    );
  }
}
