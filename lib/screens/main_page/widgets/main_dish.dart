import 'package:flutter/material.dart';

class MainDish extends StatelessWidget {
  int price;
  String name;
  String fullName;
  String? img;

  MainDish(
      {super.key,
      required this.price,
      required this.name,
      required this.fullName,
      this.img});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.orange,
                  ),
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name),
                        Text("MYR ${price.toString()}"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(fullName),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: 40,
            right: 40,
            bottom: 90,
            top: 30,
            child: Container(
                height: 20,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const CircularProgressIndicator()))),
      ],
    );
  }
}
