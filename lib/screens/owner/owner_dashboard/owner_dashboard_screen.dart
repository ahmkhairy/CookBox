import 'package:flutter/material.dart';
import 'package:karsome/screens/owner/owner_dashboard/owner_dashboard_body.dart';
import 'package:karsome/screens/owner/owner_mainpage/owner_mainpage.dart';

class OwnerDashboardScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const OwnerDashboardScreen());
  const OwnerDashboardScreen({super.key});

  @override
  State<OwnerDashboardScreen> createState() => _OwnerDashboardScreen();
}

class _OwnerDashboardScreen extends State<OwnerDashboardScreen> {
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
  // Widget build(BuildContext context) => WillPopScope(
  Widget build(BuildContext context) => (
          // onWillPop: () async {
          //   final shouldPop = await warning(context);

          //   return shouldPop ?? false;
          // },
          // child: Scaffold(
          Scaffold(
        drawer: OwnerSideMenu(),
        appBar: const OwnerMainAppBar(),
        body: const OwnerDashboardBodyPage(),
        bottomNavigationBar: const OwnerBottomAppBar(),
      ));
}
