import 'package:flutter/material.dart';
import 'package:karsome/screens/main_page/main_page_screen.dart';

class BottomNavBody extends StatefulWidget {
  const BottomNavBody({super.key});

  @override
  _BottomNavBodyState createState() => _BottomNavBodyState();
}

class _BottomNavBodyState extends State<BottomNavBody> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const MainPageScreen(),
    const Text('ok'),
    const Text('ok'),
    const Text('ok'),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.transparent,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Order'),
        ],
      ),
    );
  }
}
