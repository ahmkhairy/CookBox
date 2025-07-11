import 'package:flutter/material.dart';
import 'package:karsome/screens/customer/cart/order_view_model.dart';
import 'package:karsome/screens/owner/view_detail_order/widgets/paint.dart';

class OrderSummary extends StatefulWidget {
  dynamic data;
  OrderSummary({super.key, required this.data});

  @override
  State<OrderSummary> createState() => _OrderSummaryState(data);
}

class _OrderSummaryState extends State<OrderSummary> {
  dynamic data;
  _OrderSummaryState(this.data);

  OrderViewModel viewModel = OrderViewModel();

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 2, color: Colors.grey),
                    right: BorderSide(width: 2, color: Colors.grey),
                  )),
              child: Column(
                children: [
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
                                                data.itemList[index].productName
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20)),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              '----------- Special request -----------',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(data
                                                .itemList[index].specialRequest
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
                                    Text(data.deliveryCharge.toStringAsFixed(2),
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
                                if (data.status == 'Pending')
                                  SizedBox(
                                    height: 60,
                                    width: 250,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        viewModel.changeOrderStatus(
                                            data.orderId, "Completed");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11))),
                                      child: Text(
                                        'Complete Order',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                if (data.status == 'Completed')
                                  SizedBox(
                                    height: 60,
                                    width: 250,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11))),
                                      child: Text(
                                        'Order Completed',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                if (data.status == 'Rejected')
                                  SizedBox(
                                    height: 60,
                                    width: 250,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11))),
                                      child: Text(
                                        'Order Rejected',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }
}
