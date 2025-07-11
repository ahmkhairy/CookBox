import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';

FoodAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
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
    actions: [
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
        ),
      )
    ],
  );
}
