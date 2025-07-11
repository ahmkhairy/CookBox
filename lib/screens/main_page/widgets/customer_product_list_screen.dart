import 'package:flutter/material.dart';
import 'package:karsome/screens/User/User_mainpage_low_app_bar.dart';
import 'package:karsome/screens/food_detail/layout/widgets/food_app_bar.dart';
import 'package:karsome/screens/main_page/main_page_side_menu.dart';
import 'package:karsome/screens/main_page/widgets/customer_product_list.dart';

class CustomerViewProductsScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CustomerViewProductsScreen());
  const CustomerViewProductsScreen({super.key});

  @override
  State<CustomerViewProductsScreen> createState() =>
      _CustomerViewProductsScreenState();
}

class _CustomerViewProductsScreenState
    extends State<CustomerViewProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: FoodAppBar(context),
      body: const CustomerProductList(),
      bottomNavigationBar: const UserBottomAppBar(),
    );
  }
}
