import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';

class OrderSuccessPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const OrderSuccessPage());
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.main_page),
        child: Image.asset(
          "assets/images/orderplaced.png",
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ));
  }
}
