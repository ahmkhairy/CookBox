import 'package:flutter/material.dart';
import './add_product.dart';

class OwnerAddProductScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const OwnerAddProductScreen());
  const OwnerAddProductScreen({super.key});

  @override
  State<OwnerAddProductScreen> createState() => _OwnerAddProductScreen();
}

class _OwnerAddProductScreen extends State<OwnerAddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OwnerAddProductAppBar(),
      body: OwnerAddProductPage(),
      // bottomNavigationBar: OwnerBottomAppBar(),
    );
  }
}
