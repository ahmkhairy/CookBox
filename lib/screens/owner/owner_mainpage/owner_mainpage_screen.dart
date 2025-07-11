import 'package:flutter/material.dart';
import 'package:karsome/screens/owner/owner_mainpage/owner_mainpage.dart';

class OwnerMainPageScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const OwnerMainPageScreen());
  const OwnerMainPageScreen({super.key});

  @override
  State<OwnerMainPageScreen> createState() => _OwnerMainPageScreenState();
}

class _OwnerMainPageScreenState extends State<OwnerMainPageScreen> {
  Future<bool?> warning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Are you sure to logout?'),
          actions: [
            ElevatedButton(
                child: const Text('No'),
                onPressed: () => Navigator.pop(context, false)),
            ElevatedButton(
                child: const Text('Yes'),
                onPressed: () async {
                  // String status = await viewmodel.signOutUser();
                  Navigator.pop(context, true);
                })
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        final shouldPop = await warning(context);

        return shouldPop ?? false;
      },
      child: Scaffold(
        drawer: OwnerSideMenu(),
        appBar: const OwnerMainAppBar(),
        body: const OwnerMainPage(),
        bottomNavigationBar: const OwnerBottomAppBar(),
      ));
}
