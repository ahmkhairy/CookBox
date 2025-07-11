import 'package:flutter/material.dart';
import 'package:karsome/screens/owner/owner_mainpage/owner_mainpage.dart';
import 'package:karsome/screens/owner/view_detail_order/owner_order_detail_page.dart';

class OrderDetailScreen extends StatefulWidget {
  final dynamic data;
  const OrderDetailScreen({super.key, @required this.data});
  static Route route() =>
      MaterialPageRoute(builder: (_) => const OrderDetailScreen(data: null));

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState(data);
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  dynamic data;
  _OrderDetailScreenState(this.data);
  // Future<bool?> warning(BuildContext context) async => showDialog<bool>(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Are you sure to logout?'),
  //         actions: [
  //           ElevatedButton(
  //               child: Text('No'),
  //               onPressed: () => Navigator.pop(context, false)),
  //           ElevatedButton(
  //               child: Text('Yes'),
  //               onPressed: () async {
  //                 // String status = await viewmodel.signOutUser();
  //                 Navigator.pop(context, true);
  //               })
  //         ],
  //       ),
  //     );

  @override
  Widget build(BuildContext context) => (Scaffold(
        drawer: OwnerSideMenu(),
        appBar: const OwnerMainAppBar(),
        body: OrderSummary(data: data),
        bottomNavigationBar: const OwnerBottomAppBar(),
      ));
}
