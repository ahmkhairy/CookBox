import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';

class UserBottomAppBar extends StatefulWidget {
  const UserBottomAppBar({super.key});

  @override
  State<UserBottomAppBar> createState() => _UserBottomAppBarState();
}

class _UserBottomAppBarState extends State<UserBottomAppBar> {
  late String home = "Home";
  late String history = "History";
  late String profile = "Profile";
  late String order = "Order";
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    void loadScreen() {
      switch (_currentIndex) {
        case 0:
          Navigator.pushNamed(context, Routes.main_page);
          return;
        case 1:
          Navigator.pushNamed(context, Routes.customer_history);
          return;
        case 2:
          Navigator.pushNamed(context, Routes.profile);
          return;
        case 3:
          Navigator.pushNamed(context, Routes.cartScreen);
          return;
      }
    }

    // Directly return BottomNavigationBar instead of wrapping it in BottomAppBar
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() => _currentIndex = index);
        loadScreen();
      },
      items: [
        BottomNavigationBarItem(
            label: home, icon: const Icon(Icons.house_outlined)),
        BottomNavigationBarItem(
          label: history,
          icon: const Icon(Icons.hourglass_bottom_outlined),
        ),
        BottomNavigationBarItem(
          label: profile,
          icon: const Icon(Icons.person_outline),
        ),
        BottomNavigationBarItem(
          label: order,
          icon: const Icon(Icons.pedal_bike_outlined),
        ),
      ],
    );
  }
}
