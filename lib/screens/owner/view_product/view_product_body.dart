import 'package:flutter/material.dart';
import 'package:karsome/screens/owner/view_product/view_product_view_model.dart';

import './view_product_add_product.dart';
import '../edit_product/edit_product_screen.dart';

class OwnerViewProductPage extends StatefulWidget {
  const OwnerViewProductPage({super.key});

  @override
  State<OwnerViewProductPage> createState() => _OwnerViewProductPageState();
}

class _OwnerViewProductPageState extends State<OwnerViewProductPage> {
  ViewProductViewModel viewModel = ViewProductViewModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        children: <Widget>[
          const ViewProductAddProduct(),
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
                          onTap: null,
                          child: SizedBox(
                            width: 395,
                            height: 125,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Center(
                                        child: Image.network(
                                            (snapshot.data![index].url)),
                                      ),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                              (snapshot.data![index]
                                                      .productName) ??
                                                  "got null",
                                              style: const TextStyle(
                                                  height: 3,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              'MYR ${snapshot.data![index].productPrice}',
                                              style:
                                                  const TextStyle(height: 3)),
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 130,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 17, horizontal: 6),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: FittedBox(
                                                  child: FloatingActionButton(
                                                heroTag: "deleteButton$index",
                                                backgroundColor: Colors.red,
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  viewModel.deleteProduct(
                                                      snapshot.data![index]
                                                          .productName);
                                                  setState(() {});
                                                },
                                              ))),
                                          Container(
                                            height: 7,
                                          ),
                                          SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: FittedBox(
                                                  child: FloatingActionButton(
                                                heroTag: "editButton$index",
                                                backgroundColor: Colors.grey,
                                                child: const Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return OwnerEditProductScreen(
                                                            snapshot
                                                                .data![index]
                                                                .productName);
                                                      },
                                                    ),
                                                  );
                                                },
                                              )))
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
