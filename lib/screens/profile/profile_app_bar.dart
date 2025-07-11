import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Profile',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(222, 2, 97, 0.608),
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
