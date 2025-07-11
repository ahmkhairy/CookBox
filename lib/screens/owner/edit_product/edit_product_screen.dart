import 'package:flutter/material.dart';
import 'edit_product.dart';

class OwnerEditProductScreen extends StatefulWidget {
  final String productID;
  static Route route() =>
      MaterialPageRoute(builder: (_) => const OwnerEditProductScreen(""));
  const OwnerEditProductScreen(this.productID, {super.key});

  @override
  State<OwnerEditProductScreen> createState() => _OwnerEditProductScreen();
}

class _OwnerEditProductScreen extends State<OwnerEditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OwnerEditProductAppBar(),
      body: OwnerEditProductPage(widget.productID),
      // bottomNavigationBar: OwnerBottomAppBar(),
    );
  }
}
