import 'package:flutter/material.dart';
import 'package:karsome/screens/User/User_mainpage_low_app_bar.dart';
import 'package:karsome/screens/customer/order_history/order_history_body.dart';
import 'package:karsome/screens/main_page/main_page.dart';

class CustomerHistoryScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CustomerHistoryScreen());
  const CustomerHistoryScreen({super.key});

  @override
  State<CustomerHistoryScreen> createState() => _CustomerHistoryScreen();
}

class _CustomerHistoryScreen extends State<CustomerHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainPageUpAppBar(),
      body: CustomerOrderHistory(),
      bottomNavigationBar: UserBottomAppBar(),
    );
  }
}
