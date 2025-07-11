import 'package:flutter/material.dart';

class OwnerEditProductAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const OwnerEditProductAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Edit product', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(222, 2, 97, 0.608),
      elevation: 3.0,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
