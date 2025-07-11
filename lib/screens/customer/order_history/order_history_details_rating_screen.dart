import 'package:flutter/material.dart';
import 'package:karsome/screens/User/User_mainpage_low_app_bar.dart';
import 'package:karsome/screens/customer/order_history/order_history_details_rating_body.dart';
import 'package:karsome/screens/main_page/main_page_up_app_bar.dart';

class OrderDetailsRatingScreen extends StatefulWidget {
  final dynamic data;

  const OrderDetailsRatingScreen({super.key, @required this.data});
  static Route route() => MaterialPageRoute(
      builder: (_) => const OrderDetailsRatingScreen(data: null));

  @override
  State<OrderDetailsRatingScreen> createState() =>
      _OrderDetailsRatingScreenState(data);
}

class _OrderDetailsRatingScreenState extends State<OrderDetailsRatingScreen> {
  dynamic data;
  _OrderDetailsRatingScreenState(this.data);

  @override
  Widget build(BuildContext context) => (Scaffold(
        appBar: const MainPageUpAppBar(),
        body: OrderDetailsRatingBody(data: data),
        bottomNavigationBar: const UserBottomAppBar(),
      ));
}
