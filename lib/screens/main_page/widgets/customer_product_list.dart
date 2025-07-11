import 'package:flutter/material.dart';
import 'package:karsome/helper/navigationHelper.dart';
import 'package:karsome/screens/food_detail/food_detail.dart';
import 'package:karsome/screens/owner/view_product/view_product_view_model.dart';

class CustomerProductList extends StatefulWidget {
  const CustomerProductList({super.key});

  @override
  State<CustomerProductList> createState() => _CustomerProductListState();
}

class _CustomerProductListState extends State<CustomerProductList> {
  ViewProductViewModel viewModel = ViewProductViewModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: Column(
        children: <Widget>[
          FutureBuilder<List<dynamic>?>(
              future: viewModel.getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(179, 219, 219, 219),
                              width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 254, 223, 188),
                          onTap: () {
                            NavigationHelper.pushRoute(
                                context,
                                FoodDetailViewFuture(
                                    productName: snapshot
                                        .data![index].productName
                                        .toString(),
                                    productPrice: snapshot
                                        .data![index].productPrice
                                        .toString(),
                                    url: snapshot.data![index].url.toString(),
                                    productDescription: snapshot
                                        .data![index].productDescription
                                        .toString(),
                                    category: snapshot.data![index].category
                                        .toString()));
                          },
                          child: SizedBox(
                            width: 395,
                            height: 100,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Center(
                                        child: Image.network(
                                          (snapshot.data![index].url),
                                          height: 70,
                                          width: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 20, 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                                (snapshot.data![index]
                                                        .productName) ??
                                                    "got null",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Expanded(
                                            child: Text(
                                                (snapshot.data![index]
                                                        .productDescription) ??
                                                    "got null",
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 87, 87, 87))),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'MYR ' +
                                                  ((snapshot.data![index]
                                                          .productPrice))
                                                      .toStringAsFixed(2),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ],
      ),
    ));
  }
}
