import 'package:flutter/material.dart';
import 'package:karsome/screens/bottomNavigation/layout/bottom_nav_body.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavBody(),
    );
  }
}
