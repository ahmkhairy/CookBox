import 'package:flutter/material.dart';

import './view_product.dart';
import '../owner_mainpage_low_app_bar.dart';

class OwnerViewProductScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const OwnerViewProductScreen());
  const OwnerViewProductScreen({super.key});

  @override
  State<OwnerViewProductScreen> createState() => _OwnerViewProductScreen();
}

class _OwnerViewProductScreen extends State<OwnerViewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ViewProductAppBar(),
      body: OwnerViewProductPage(),
      bottomNavigationBar: OwnerBottomAppBar(),
    );
  }
}
