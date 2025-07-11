import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';

class ViewProductAddProduct extends StatelessWidget
    implements PreferredSizeWidget {
  const ViewProductAddProduct({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    void redirectToAddProductPage() {
      Navigator.pushNamed(context, Routes.owner_addProduct);
    }

    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Material(
            type: MaterialType.transparency,
            child: Ink(
              height: 50,
              width: 400,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(222, 2, 97, 0.608),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: InkWell(
                onTap: redirectToAddProductPage,
                child: const Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Center(
                      child: Text(
                    '+',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 35),
                  )),
                ),
              ),
            )));
  }
}
