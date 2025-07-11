import 'dart:io';

import 'package:flutter/material.dart';
import 'package:karsome/screens/owner/edit_product/edit_product_view_model.dart';

import '../../../app/routes.dart';

class OwnerEditProductPage extends StatefulWidget {
  final String productID;
  static Route route() =>
      MaterialPageRoute(builder: (_) => const OwnerEditProductPage(""));
  const OwnerEditProductPage(this.productID, {super.key});

  @override
  State<OwnerEditProductPage> createState() => _OwnerEditProductPageState();
}

class _OwnerEditProductPageState extends State<OwnerEditProductPage> {
  String dropdownValue = 'Other';
  EditProductViewModel viewModel = EditProductViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String productName = "";
    double productPrice = 0.0;
    String productDescription = "";
    String category = "";
    String dropdownvalue = 'Other';
    String newValue;
    File? image;
    File? cameraImage;
    File? storageImage;

    // List of items in our dropdown menu
    var items = [
      'Food',
      'Drinks',
      'Dessert',
      'Other',
    ];

    final formKey = GlobalKey<FormState>();

    return Scaffold(
        body: Form(
            key: formKey,
            child: StatefulBuilder(builder: (context, setState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: const Text('Product Details',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<dynamic>(
                      future: viewModel.getProductInfo(widget.productID),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          dynamic productData = snapshot.data!;

                          productName = productData.productName;
                          productPrice = productData.productPrice;
                          productDescription = productData.productDescription;
                          category = productData.category;

                          return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 120),
                              child: Image.network((productData.url)));
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 45),
                        child: const Text(
                          'Choose Product Category:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromARGB(255, 110, 110, 110)),
                        )),
                    Container(
                        margin: const EdgeInsets.fromLTRB(45, 2, 45, 10),
                        child: FutureBuilder<dynamic>(
                          future: viewModel.getProductInfo(widget.productID),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              dynamic productData = snapshot.data!;
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                dropdownvalue = productData.category;
                                return DropdownButton(
                                  isExpanded: true,
                                  value: dropdownvalue,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                );
                              });
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          FutureBuilder<dynamic>(
                            future: viewModel.getProductInfo(widget.productID),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                dynamic productData = snapshot.data!;
                                return TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Product Name';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    productName = value;
                                  },
                                  initialValue: productData.productName,
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(Icons.card_giftcard_rounded),
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FutureBuilder<dynamic>(
                            future: viewModel.getProductInfo(widget.productID),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                dynamic productData = snapshot.data!;
                                return TextFormField(
                                  initialValue: productData.productDescription,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Product Description';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    productDescription = value;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(Icons.edit_note_rounded),
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    hintText: 'Enter Product Description',
                                  ),
                                  keyboardType: TextInputType.text,
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FutureBuilder<dynamic>(
                            future: viewModel.getProductInfo(widget.productID),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                dynamic productData = snapshot.data!;

                                return TextFormField(
                                  initialValue: "${productData.productPrice}",
                                  validator: (value) {
                                    if (value == null ||
                                        double.parse(value) < 0 ||
                                        value.isEmpty) {
                                      return 'Product Price cannot be less than 0';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    productPrice = double.parse(value);
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(Icons.attach_money_rounded),
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    hintText: 'Enter Product Price',
                                  ),
                                  keyboardType: TextInputType.number,
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 45),
                              child: const Text(
                                'Edit Product Image:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 110, 110, 110)),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 10,
                                child: OutlinedButton.icon(
                                    onPressed: () async {
                                      storageImage =
                                          await viewModel.selectImageStorage();
                                      setState(() => image = storageImage);
                                    },
                                    icon: const Icon(Icons.image_rounded),
                                    label: const Text('From Gallery'),
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.all(10),
                                      side: const BorderSide(
                                          width: 3, color: Colors.blue),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    )),
                              ),
                              const Expanded(flex: 2, child: SizedBox()),
                              Expanded(
                                flex: 10,
                                child: OutlinedButton.icon(
                                    onPressed: () async {
                                      cameraImage =
                                          await viewModel.selectImageCamera();
                                      setState(() => image = cameraImage);
                                    },
                                    icon: const Icon(Icons.camera_alt_rounded),
                                    label: const Text('From Camera'),
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.all(10),
                                      side: const BorderSide(
                                          width: 3, color: Colors.blue),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<dynamic>(
                      future: viewModel.getProductInfo(widget.productID),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          dynamic productData = snapshot.data!;

                          return Container(
                            margin: const EdgeInsets.fromLTRB(35, 30, 35, 1),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  String url;
                                  try {
                                    if (image == null) {
                                      url = productData.url;
                                    } else {
                                      url = await viewModel.uploadImage(image);
                                    }

                                    await viewModel.updateProduct(
                                        widget.productID,
                                        productName,
                                        productPrice,
                                        productDescription,
                                        dropdownvalue,
                                        url);
                                    Navigator.pushReplacementNamed(
                                        context, Routes.owner_viewProduct);
                                  } catch (e) {
                                    //will pass the e to show dialog and based on if user exist we display the following
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Error'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: const Text(
                                                  'proceed to login'),
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, Routes.signIn);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(40, 15, 40, 15),
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Colors.white),
                              ),
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 35),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          side: const BorderSide(
                              width: 3,
                              color: Color.fromRGBO(222, 2, 97, 0.608)),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              );
            })));
  }
}
