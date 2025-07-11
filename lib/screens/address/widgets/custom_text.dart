import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double? fontSize;
  FontWeight? fontWeight;

  CustomText(
      {super.key,
      required this.text,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
