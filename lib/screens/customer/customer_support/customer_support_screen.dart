import 'package:flutter/material.dart';
import 'package:karsome/screens/User/User_mainpage_low_app_bar.dart';
import 'package:karsome/screens/customer/customer_support/customer_support_body.dart';
import 'package:karsome/screens/main_page/main_page.dart';

class CustomerSupportScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CustomerSupportScreen());
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerHistoryScreen();
}

class _CustomerHistoryScreen extends State<CustomerSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainPageUpAppBar(),
      body: CustomerSupoprtBody(),
      bottomNavigationBar: UserBottomAppBar(),
    );
  }
}
