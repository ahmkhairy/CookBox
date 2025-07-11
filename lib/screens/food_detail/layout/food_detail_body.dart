import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karsome/app/appState.dart';
import 'package:karsome/app/enums.dart';
import 'package:karsome/infrastructure/models/add_to_cart.dart';
import 'package:karsome/infrastructure/services/productServices.dart';
import 'package:karsome/screens/food_detail/layout/widgets/detail_text_field.dart';
import 'package:provider/provider.dart';

class FoodDetailBody extends StatefulWidget {
  String image;
  int price;
  String name;
  String decription;

  FoodDetailBody(
      {super.key,
      required this.image,
      required this.price,
      required this.name,
      required this.decription});

  @override
  State<FoodDetailBody> createState() => _FoodDetailBodyState();
}

int index = 1;

ProductServices services = ProductServices();
TextEditingController controller = TextEditingController();

class _FoodDetailBodyState extends State<FoodDetailBody> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // ignore: unnecessary_statements
    index;
    widget.price;
  }

  @override
  Widget build(BuildContext context) {
    int productPrice = widget.price;
    var status = Provider.of<AppState>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                widget.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Text(
                  widget.decription,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width / 1.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Special Request'),
            const SizedBox(
              height: 10,
            ),
            DetailTextField(
              hint: 'i Want',
              maxLines: 3,
              validator: (val) {},
              data: controller,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (index > 1) {
                      int tempProductPrice = widget.price;
                      index--;
                      tempProductPrice = productPrice - tempProductPrice;
                      productPrice = tempProductPrice;
                      tempProductPrice = widget.price;

                      setState(() {});
                    }
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.brown,
                    child: Icon(CupertinoIcons.minus),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  index.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    int tempProductPrice = widget.price;
                    index++;
                    tempProductPrice = productPrice + tempProductPrice;
                    productPrice = tempProductPrice;
                    // tempProductPrice = widget.price;
                    setState(() {});
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.brown,
                    child: Icon(CupertinoIcons.plus),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('MYR $productPrice'),
                GestureDetector(
                  onTap: () {
                    status.stateStatus(AppCurrentState.IsBusy);
                    services
                        .addToCart(
                            addToCartModel: AddToCartModel(
                      totalCount: index,
                      url: widget.image,
                      productDescription: widget.decription,
                      productName: widget.name,
                      totalPrice: double.parse(widget.price.toString()),
                      specialRequest: controller.text,
                    ))
                        .whenComplete(() {
                      status.stateStatus(AppCurrentState.IsFree);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.orange,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
