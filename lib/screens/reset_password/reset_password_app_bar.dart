import 'package:flutter/material.dart';

class ResetPassAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ResetPassAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Text(
      //   'Reset Psssword',
      //   style: TextStyle(color: Colors.white),
      // ),
      elevation: 0.0,
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
