import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      // child: TextFormField(
      //   textAlignVertical: TextAlignVertical.center,
      //   decoration: InputDecoration(
      //       border: InputBorder.none,
      //       prefixIcon: Icon(Icons.search),
      //       hintText: 'Search our new Menu',
      //       hintStyle: TextStyle(color: Color.fromARGB(255, 139, 139, 139))),
      // ),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(8),
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //           color: Color.fromARGB(255, 233, 233, 233),
      //           blurRadius: 4,
      //           offset: Offset(3, 3),
      //           spreadRadius: 4.5)
      //     ]),
    );
  }
}
