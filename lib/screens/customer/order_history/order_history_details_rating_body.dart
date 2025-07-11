import 'package:flutter/material.dart';
import 'package:karsome/models/user.dart';
import 'package:karsome/screens/customer/order_history/order_history_view_model.dart';
import 'package:karsome/screens/owner/view_detail_order/widgets/paint.dart';

class OrderDetailsRatingBody extends StatefulWidget {
  dynamic data;
  OrderDetailsRatingBody({super.key, required this.data});

  @override
  State<OrderDetailsRatingBody> createState() =>
      _OrderDetailsRatingBodyState(data);
}

class _OrderDetailsRatingBodyState extends State<OrderDetailsRatingBody> {
  dynamic data;
  _OrderDetailsRatingBodyState(this.data);
  OrderHistoryViewModel viewModel = OrderHistoryViewModel();
  bool isRated = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 232, 232, 232),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 75, 75, 75)),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      left: BorderSide(width: 2, color: Colors.grey),
                      right: BorderSide(width: 2, color: Colors.grey),
                    )),
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      size: 80,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Payment Complete',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Order Number:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      data.orderId.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                            const Row(
                              children: [
                                Expanded(
                                    flex: 6,
                                    child: Text('Item',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Expanded(
                                    flex: 2,
                                    child: Text('Quantity',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                              ],
                            ),
                            const Divider(
                              height: 15,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: Color.fromARGB(255, 87, 87, 87),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.itemList.length,
                              itemBuilder: (context, index) {
                                return Column(children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  data.itemList[index]
                                                      .productName
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 20)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                '----------- Special request -----------',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(data.itemList[index]
                                                  .specialRequest
                                                  .toString())
                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                              "x ${data.itemList[index].quantity}",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20))),
                                    ],
                                  ),
                                  const Divider(
                                    height: 15,
                                    thickness: 2,
                                    indent: 0,
                                    endIndent: 0,
                                    color: Color.fromARGB(255, 175, 175, 175),
                                  ),
                                ]);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Column(
                        children: <Widget>[
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
                                            color: Color.fromARGB(
                                                255, 121, 119, 119),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        data.itemTotal.toStringAsFixed(2),
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
                                      Text(
                                          data.deliveryCharge
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
                                      const Text('GST 6%',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 121, 119, 119),
                                              fontWeight: FontWeight.w500)),
                                      Text(data.gst.toStringAsFixed(2),
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
                                        'MYR ' + data.total.toStringAsFixed(2),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  isRated == false
                                      ?Card(
  color: const Color.fromARGB(255, 161, 4, 101),
  elevation: 2.0,
  shape: RoundedRectangleBorder(
    side: const BorderSide(
        color: Color.fromARGB(179, 219, 219, 219), width: 1),
    borderRadius: BorderRadius.circular(12),
  ),
  child: SizedBox(
    width: double.infinity, // Make it expand to parent
    height: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform.scale(
          scale: 1.2,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              viewModel.submitRating(data.orderId.toString(), 'Dislike');
              setState(() {
                isRated = true;
              });
            },
            icon: Image.asset(
              'assets/images/thumbsdown.png',
              height: 32,
              width: 32,
            ),
          ),
        ),
        const SizedBox(width: 30),
        const Text(
          'Rate Us?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromARGB(255, 255, 242, 223),
          ),
        ),
        const SizedBox(width: 30),
        Transform.scale(
          scale: 1.2,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              viewModel.submitRating(data.orderId.toString(), 'Like');
              setState(() {
                isRated = true;
              });
            },
            icon: Image.asset(
              'assets/images/thumbsup.png',
              height: 32,
              width: 32,
            ),
          ),
        ),
      ],
    ),
  ),
)

                                      : const Text('Thank you for rating us!'),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomPaint(
                                    size: MediaQuery.of(context).size / 200,
                                    painter: MyPainter(),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(222, 2, 97, 0.608),
                  foregroundColor: Colors.white,
                ),
                label: const Text("Gnerate PDF"),
                icon: const Icon(Icons.print_rounded),
                onPressed: () async {},
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    });
  }
}
