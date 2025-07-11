import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karsome/infrastructure/models/add_to_cart.dart';
import 'package:karsome/infrastructure/services/productServices.dart';
import 'package:karsome/screens/food_detail/layout/widgets/detail_text_field.dart';
import 'package:karsome/app/routes.dart';

class FoodDetailBodyFuture extends StatefulWidget {
  final url;
  final productPrice;
  final productName;
  final productDescription;
  final category;

  const FoodDetailBodyFuture(
      {super.key,
      required this.url,
      required this.productPrice,
      required this.productName,
      required this.productDescription,
      required this.category});

  @override
  State<FoodDetailBodyFuture> createState() => _FoodDetailBodyFutureState();
}

int index = 1;

ProductServices services = ProductServices();
TextEditingController controller = TextEditingController();

class _FoodDetailBodyFutureState extends State<FoodDetailBodyFuture> {
  @override
  void dispose() {
    super.dispose();
    // ignore: unnecessary_statements
    index;
    widget.productPrice;
  }

  @override
  Widget build(BuildContext context) {
    double productPrice = double.parse(widget.productPrice);
    // var status = Provider.of<AppState>(context);
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.productName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Text(
                    widget.productDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
  child: SizedBox(
    height: 200,
    width: MediaQuery.of(context).size.width / 1.1,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        widget.url,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Icon(Icons.broken_image, size: 60, color: Colors.grey),
          );
        },
      ),
    ),
  ),
),

              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    'Special Request:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 177, 177, 177),
                            blurRadius: 3,
                            offset: Offset(1, 2),
                            spreadRadius: 2)
                      ]),
                  child: DetailTextField(
                    hint: 'I want more ...',
                    maxLines: 3,
                    validator: (val) {},
                    data: controller,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (index > 1) {
                        double tempProductPrice =
                            double.parse(widget.productPrice);
                        index--;
                        tempProductPrice = productPrice - tempProductPrice;
                        productPrice = tempProductPrice;
                        tempProductPrice = double.parse(widget.productPrice);

                        setState(() {});
                      }
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(200, 118, 22, 0.6),
                      child: Icon(
                        CupertinoIcons.minus,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    index.toString(),
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      double tempProductPrice =
                          double.parse(widget.productPrice);
                      index++;
                      tempProductPrice = productPrice + tempProductPrice;
                      productPrice = tempProductPrice;
                      tempProductPrice = double.parse(widget.productPrice);
                      setState(() {});
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(200, 118, 22, 0.6),
                      child: Icon(
                        CupertinoIcons.plus,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Total',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'MYR ${productPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )
                      ]),
                  GestureDetector(
                    onTap: () async {
                      // status.stateStatus(AppCurrentState.IsBusy);
                      await services
                          .addToCartFuture(
                              addToCartModel: AddToCartModel(
                        totalCount: index,
                        url: widget.url,
                        productDescription: widget.productDescription,
                        productName: widget.productName,
                        totalPrice: productPrice,
                        specialRequest: controller.text,
                      ))
                          .whenComplete(() {
                        // status.stateStatus(AppCurrentState.IsFree);
                        Navigator.pushNamed(context, Routes.main_page);
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromRGBO(222, 2, 97, 0.608),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/cart_white.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Add to Cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
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
    });
  }
}
