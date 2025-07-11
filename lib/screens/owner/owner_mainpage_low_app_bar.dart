import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';

class OwnerBottomAppBar extends StatefulWidget {
  const OwnerBottomAppBar({super.key});

  @override
  State<OwnerBottomAppBar> createState() => _OwnerBottomAppBarState();
}

class _OwnerBottomAppBarState extends State<OwnerBottomAppBar> {
  int _currentIndex = 0;

  final List<String> labels = ["Orders", "Menu", "Profile"];
  final List<IconData> icons = [
    Icons.receipt_long_outlined,
    Icons.dashboard_outlined,
    Icons.person_outline
  ];
  final List<String> routes = [
    Routes.owner_mainpage,
    Routes.owner_viewProduct,
    Routes.profile,
  ];

  void _onTap(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
    Navigator.pushNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: List.generate(
          labels.length,
          (index) => BottomNavigationBarItem(
            label: labels[index],
            icon: Icon(icons[index]),
          ),
        ),
      ),
    );
  }
}

