import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Cart',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Transform.scale(
        scale: 1.35,
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/images/Back.png',
              scale: 0.05,
            ),
          ),
        ),
      ),
    );
  }
}
