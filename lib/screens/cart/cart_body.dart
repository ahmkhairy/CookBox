import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';
import 'package:karsome/helper/navigationHelper.dart';
import 'package:karsome/infrastructure/models/address_model.dart';
import 'package:karsome/infrastructure/services/address_services.dart';
import 'package:karsome/infrastructure/services/getUserId.dart';
import 'package:karsome/models/cart.dart';
import 'package:karsome/screens/address/add_address.dart';
import 'package:karsome/screens/address/widgets/custom_text.dart';
import 'package:karsome/screens/customer/cart/cart_view_model.dart';
import 'package:karsome/screens/customer/cart/order_view_model.dart';

import 'package:karsome/screens/food_detail/layout/widgets/cart_detail_future.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartViewModel viewModel = CartViewModel();
  OrderViewModel orderModel = OrderViewModel();

  @override
  Widget build(BuildContext context) {
    double itemTotal = 0.0;
    bool delivery = true;
    double deliveryCharge = 2.00;
    double gst = 0.06;
    double newgst = 0.0;
    double total = 0.0;
    int count = 0;
    bool hasItem = false;
    bool isDelivery = true;
    bool isPickup = false;
    String type = "";
    List<CartItem> orderList = [];
    final formKey = GlobalKey<FormState>();

    return Form(
        key: formKey,
        child: StatefulBuilder(builder: (context, setState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Column(
                    children: <Widget>[
                      FutureBuilder<List<CartItem>?>(
                          future: viewModel.getCartitems(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              itemTotal = 0.0;
                              gst = 0.06;
                              count = 0;
                              int len = snapshot.data!.length;
                              if (len == 0) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Image.asset(
                                        "assets/images/notfound.png",
                                        height: 30,
                                      ),
                                    ),
                                    const Text('No item in cart',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepOrange),
                                        textAlign: TextAlign.center),
                                  ],
                                );
                              } else {
                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    orderList.add(snapshot.data![index]);
                                    itemTotal +=
                                        snapshot.data![index].totalPrice;
                                    count += snapshot.data![index].totalCount;
                                    return SingleChildScrollView(
                                      child: Card(
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  179, 219, 219, 219),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: InkWell(
                                          splashColor: const Color.fromARGB(
                                              255, 254, 223, 188),
                                          onTap: () {
                                            // debug
                                            NavigationHelper.pushRoute(
                                                context,
                                                CartDetailViewFuture(
                                                    productName: snapshot
                                                        .data![index]
                                                        .productName
                                                        .toString(),
                                                    totalCount: snapshot
                                                        .data![index].totalCount
                                                        .toString(),
                                                    productDescription: snapshot
                                                        .data![index]
                                                        .productDescription
                                                        .toString(),
                                                    totalPrice: snapshot
                                                        .data![index].totalPrice
                                                        .toString(),
                                                    url: snapshot.data![index].url
                                                        .toString(),
                                                    specialRequest: snapshot
                                                        .data![index]
                                                        .specialRequest
                                                        .toString(),
                                                    docId: snapshot.data![index].docId
                                                        .toString()));
                                          },
                                          child: SizedBox(
                                            width: 395,
                                            height: 125,
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10,
                                                          horizontal: 20),
                                                      child: Center(
                                                        child: Image.network(
                                                            (snapshot
                                                                .data![index]
                                                                .url)),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 5,
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10,
                                                          horizontal: 20),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                              (snapshot
                                                                  .data![index]
                                                                  .productName),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  height: 3,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          Text(
                                                              'MYR ${snapshot.data![index].totalPrice}',
                                                              style:
                                                                  const TextStyle(
                                                                      height:
                                                                          3)),
                                                        ],
                                                      ),
                                                    )),
                                                FloatingActionButton(
                                                  heroTag: "deleteButton$index",
                                                  backgroundColor: Colors.red,
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    viewModel.deleteCartItem(
                                                        snapshot
                                                            .data![index].docId
                                                            .toString());
                                                    setState(() {});
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                    // return Text(
                                    //     (snapshot.data![index].category) ?? "got null");
                                  },
                                );
                              }
                            }

                            /// handles others as you did on question
                            else {
                              return const CircularProgressIndicator();
                            }
                          }),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 15,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(18),
                                      backgroundColor: isDelivery
                                          ? const Color.fromARGB(255, 5, 5, 5)
                                          : const Color.fromARGB(
                                              255, 161, 161, 161), // background
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              16)) // foreground
                                      ),
                                  onPressed: () {
                                    setState(() {
                                      deliveryCharge = 2.00;
                                      hasItem = true;
                                      isDelivery = true;
                                      isPickup = false;
                                      type = "delivery";
                                    });
                                  },
                                  child: const Text('Delivery'),
                                )),
                            const Expanded(flex: 2, child: SizedBox()),
                            Expanded(
                                flex: 15,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(18),
                                      backgroundColor: isPickup
                                          ? const Color.fromARGB(255, 5, 5, 5)
                                          : const Color.fromARGB(
                                              255, 161, 161, 161), // background
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              16)) // foreground
                                      ),
                                  onPressed: () {
                                    setState(() {
                                      deliveryCharge = 0.00;
                                      hasItem = true;
                                      isDelivery = false;
                                      isPickup = true;
                                      type = "pickup";
                                    });
                                  },
                                  child: const Text('Pickup'),
                                ))
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Item Total',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 121, 119, 119),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    itemTotal.toStringAsFixed(2),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Delivery Charge',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 121, 119, 119),
                                          fontWeight: FontWeight.w500)),
                                  Text(deliveryCharge.toStringAsFixed(2),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('GST 6%',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 121, 119, 119),
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      (newgst = gst * itemTotal)
                                          .toStringAsFixed(2),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'MYR ${(total = itemTotal + newgst + deliveryCharge).toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              if (isDelivery)
                                StreamProvider.value(
                                  value: AddressServices()
                                      .fetchUserRecord(getUserID()),
                                  initialData: AddAddressModel(),
                                  builder: (context, child) {
                                    AddAddressModel address =
                                        context.watch<AddAddressModel>();
                                    return Column(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    text:
                                                        'Delivery Information',
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomText(
                                                    text: address.address
                                                        .toString(),
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  address.area
                                                          .toString()
                                                          .isEmpty
                                                      ? const Text(
                                                          'Not Available')
                                                      : CustomText(
                                                          text: address.area
                                                              .toString(),
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomText(
                                                    text: address.floor
                                                        .toString(),
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomText(
                                                    text: address.apartment
                                                        .toString(),
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomText(
                                                    text: address.additionalInfo
                                                        .toString(),
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        NavigationHelper
                                                            .pushRoute(
                                                                context,
                                                                AddAddressView(
                                                                  address: address
                                                                      .address
                                                                      .toString(),
                                                                  area: address
                                                                      .area
                                                                      .toString(),
                                                                  bName: address
                                                                      .buildingName
                                                                      .toString(),
                                                                  floor: address
                                                                      .floor
                                                                      .toString(),
                                                                  apartment: address
                                                                      .apartment
                                                                      .toString(),
                                                                  additional: address
                                                                      .additionalInfo
                                                                      .toString(),
                                                                ));
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.1)),
                                                        child: const Center(
                                                            child: Icon(
                                                          Icons.edit,
                                                          size: 15,
                                                          color: Colors.orange,
                                                        )),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              SizedBox(
                                height: 60,
                                width: 250,
                                child: ElevatedButton(
                                  onPressed: hasItem == false
                                      ? null
                                      : () {
                                          orderModel
                                              .submitOrder(
                                                  orderList,
                                                  itemTotal,
                                                  deliveryCharge,
                                                  newgst,
                                                  total,
                                                  count,
                                                  type)
                                              .whenComplete(() async {
                                            // status.stateStatus(AppCurrentState.IsFree);
                                            await viewModel.clearCart();
                                            Navigator.pushNamed(
                                                context, Routes.order_payment);
                                          });
                                        },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(
                                          222, 2, 97, 0.608),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(11))),
                                  child: Text(
                                    'Proceed to Payment',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
