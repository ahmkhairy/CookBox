import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailTextField extends StatelessWidget {
  final TextEditingController data;
  int maxLines = 1;
  String hint;
  TextDirection textDirection;

  Function(String) validator;
  bool enabled;
  TextInputType keyBoardType;

  DetailTextField(
      {super.key,
      required this.data,
      this.maxLines = 1,
      this.keyBoardType = TextInputType.text,
      this.textDirection = TextDirection.ltr,
      required this.validator,
      required this.hint,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextFormField(
              keyboardType: keyBoardType,
              controller: data,
              validator: (val) => validator(val!),
              textDirection: textDirection,
              cursorColor: Colors.black,
              enabled: enabled,
              maxLines: maxLines,
              style: const TextStyle(color: Colors.black),
              decoration: textFieldDecoration(context, hint)),
        ),
      ),
    );
  }

  textFieldDecoration(BuildContext context, [String? hint]) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none);
    return InputDecoration(
        disabledBorder: outlineInputBorder,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: hint ?? '',
        hintStyle: const TextStyle(
            color: Colors.black26, fontSize: 14, fontWeight: FontWeight.w500),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder);
  }
}
