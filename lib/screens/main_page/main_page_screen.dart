import 'package:flutter/material.dart';
import 'package:karsome/screens/User/User_mainpage_low_app_bar.dart';
import 'package:karsome/screens/owner/owner_dashboard/owner_dashboard_view_model.dart';
import './main_page.dart';
import 'main_page_viewmodel.dart';

class MainPageScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const MainPageScreen());
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

MainPageViewModel viewmodel = MainPageViewModel();
DashboardViewModel statusViewModel = DashboardViewModel();

class _MainPageScreenState extends State<MainPageScreen> {
  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
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
                  String status = await viewmodel.signOutUser();

                  Navigator.pop(context, true);
                })
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);

        return shouldPop ?? false;
      },
      child: Scaffold(
          drawer: SideMenu(),
          appBar: const MainPageUpAppBar(),
          body: const MainPage(),
          bottomNavigationBar: const UserBottomAppBar()));
}
