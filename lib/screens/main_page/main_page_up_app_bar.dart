import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';

class MainPageUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainPageUpAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: <Widget>[
        Transform.scale(
            scale: 1.35,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                padding: const EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.cartScreen);
                },
                icon: Image.asset(
                  'assets/images/cart.png',
                  scale: 0.05,
                ),
              ),
            ))
      ],
    );
  }
}
