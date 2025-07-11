import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:karsome/screens/owner/owner_dashboard/owner_dashboard_view_model.dart';
import 'package:karsome/screens/owner/owner_dashboard/widgets/card_builder.dart';

class OwnerDashboardBodyPage extends StatefulWidget {
  const OwnerDashboardBodyPage({super.key});

  @override
  State<OwnerDashboardBodyPage> createState() => _OwnerDashboardBodyPageState();
}

class _OwnerDashboardBodyPageState extends State<OwnerDashboardBodyPage> {
  String heading = "";
  String total = '0';
  DashboardViewModel viewModel = DashboardViewModel();
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        child: FutureBuilder<List<String>?>(
            future: viewModel.getDashboardDetails(),
            builder: (context, data) {
              if (data.hasData &&
                  data.connectionState == ConnectionState.done) {
                total = data.data![0].toString();
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: CardBuilder(
                          heading: 'Pending orders',
                          number: data.data![1].toString(),
                        )),
                        Expanded(
                            child: CardBuilder(
                          heading: 'Customer satisfaction',
                          number: '${data.data![2]} %',
                        )),
                      ],
                    ),
                    CardBuilder(
                      heading: 'Total revenue',
                      number: 'MYR $total',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      isSwitched == false
                          ? 'Shop Status: Closed'
                          : 'Shop Status: Opened',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Transform.scale(
                      scale: 1.8,
                      child: StreamBuilder<QuerySnapshot>(
                          stream: viewModel.status,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text('cant fetch status'),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            final data = snapshot.requireData;

                            return Switch(
                                value: data.docs[0]['isOpen'],
                                onChanged: (value) async {
                                  await viewModel.updateShopStatus(value);
                                  setState(() {
                                    isSwitched = value;
                                  });
                                });
                          }),
                    ),
                  ],
                );
              } else {
                return Container(
                  child: const Text('cannot connect ot database'),
                );
              }
            }),
      );
    });
  }
}
