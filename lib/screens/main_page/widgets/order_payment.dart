import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';

class OrderPaymentPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const OrderPaymentPage());
  const OrderPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.order_success),
        child: Image.asset(
          "assets/images/payment.png",
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ));
  }
}
