import 'package:flutter/material.dart';
import 'package:karsome/helper/navigationHelper.dart';
import 'package:karsome/screens/customer/cart/order_view_model.dart';
import 'package:karsome/screens/owner/view_detail_order/order_detail_screen.dart';

class OwnerMainPage extends StatefulWidget {
  const OwnerMainPage({super.key});

  @override
  State<OwnerMainPage> createState() => _OwnerMainPageState();
}



class _OwnerMainPageState extends State<OwnerMainPage> {
  OrderViewModel viewModel = OrderViewModel();
String status = "Pending";
int selectIndex = 1;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SafeArea(
          child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      TextButton(
                          style: ButtonStyle(
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(15)),
                              foregroundColor: selectIndex == 1
                                  ? WidgetStateProperty.all<Color>(Colors.white)
                                  : WidgetStateProperty.all<Color>(
                                      const Color.fromRGBO(222, 2, 97, 0.608)),
                              backgroundColor: selectIndex == 1
                                  ? WidgetStateProperty.all<Color>(
                                      const Color.fromRGBO(222, 2, 97, 0.608))
                                  : WidgetStateProperty.all<Color>(Colors.white),
                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Color.fromRGBO(
                                              222, 2, 97, 0.608))))),
                          onPressed: () => setState(() {
                                selectIndex = 1;
                                status = "Pending";
                              }),
                          child: Text("pending".toUpperCase(), style: TextStyle(fontSize: 14))),
                      const SizedBox(width: 10),
                      TextButton(
                          style: ButtonStyle(
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(15)),
                              foregroundColor: selectIndex == 2
                                  ? WidgetStateProperty.all<Color>(Colors.white)
                                  : WidgetStateProperty.all<Color>(
                                      const Color.fromRGBO(222, 2, 97, 0.608)),
                              backgroundColor: selectIndex == 2
                                  ? WidgetStateProperty.all<Color>(
                                      const Color.fromRGBO(222, 2, 97, 0.608))
                                  : WidgetStateProperty.all<Color>(Colors.white),
                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Color.fromRGBO(
                                              222, 2, 97, 0.608))))),
                          onPressed: () => setState(() {
                                selectIndex = 2;
                                status = "Completed";
                              }),
                          child: Text("completed".toUpperCase(), style: TextStyle(fontSize: 14))),
                      const SizedBox(width: 10),
                      TextButton(
                          style: ButtonStyle(
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(15)),
                              foregroundColor: selectIndex == 3
                                  ? WidgetStateProperty.all<Color>(Colors.white)
                                  : WidgetStateProperty.all<Color>(
                                      const Color.fromRGBO(222, 2, 97, 0.608)),
                              backgroundColor: selectIndex == 3
                                  ? WidgetStateProperty.all<Color>(
                                      const Color.fromRGBO(222, 2, 97, 0.608))
                                  : WidgetStateProperty.all<Color>(Colors.white),
                              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Color.fromRGBO(
                                              222, 2, 97, 0.608))))),
                          onPressed: () => setState(() {
                                selectIndex = 3;
                                status = "Rejected";
                              }),
                          child: Text("Rejected".toUpperCase(), style: TextStyle(fontSize: 14))),
                    ]),
                    FutureBuilder<List<dynamic>?>(
                        future: viewModel.getOrders(status),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.connectionState == ConnectionState.done) {
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
                                  const Text('Nothing to show here...',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange),
                                      textAlign: TextAlign.center),
                                ],
                              );
                            } else {
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Card(
  elevation: 3,
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
    side: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
  ),
  child: InkWell(
    borderRadius: BorderRadius.circular(16),
    splashColor: const Color(0xFFFFF3E0),
    onTap: () {
      NavigationHelper.pushRoute(
        context,
        OrderDetailScreen(data: snapshot.data![index]),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Left info column
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow('🆔 Order ID:', snapshot.data![index].orderId.toString()),
                _infoRow('⏰ Time:', snapshot.data![index].orderTime.toString()),
                _infoRow(
                  '📦 Type:',
                  snapshot.data![index].deliveryCharge.toString() == '2.0'
                      ? 'Delivery'
                      : 'Pick up',
                ),
                _infoRow(
                  '💵 Total:',
                  'MYR ${snapshot.data![index].total}',
                ),
                _infoRow(
                  '🧾 Items:',
                  snapshot.data![index].totalCount.toString(),
                ),
              ],
            ),
          ),

          // Right button column
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      NavigationHelper.pushRoute(
                        context,
                        OrderDetailScreen(data: snapshot.data![index]),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC87616),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'View',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                if (snapshot.data![index].status == 'Pending')
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.changeOrderStatus(
                          snapshot.data![index].orderId,
                          "Rejected",
                        );
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text(
                        'Reject',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);

                                },
                              );
                            }
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                  ],
                ),
              )),
        );
      },
    );
  }
  Widget _infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13.5,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 13.5),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

}
