import 'package:flutter/material.dart';

addressAppBar(String text){
  return AppBar(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(text),
  );
}