import 'dart:io';

import 'package:flutter/material.dart';
import 'package:karsome/screens/owner/add_product/add_product_view_model.dart';
import '../../../app/routes.dart';

class OwnerAddProductPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const OwnerAddProductPage());
  const OwnerAddProductPage({super.key});

  @override
  State<OwnerAddProductPage> createState() => _OwnerAddProductPageState();
}

class _OwnerAddProductPageState extends State<OwnerAddProductPage> {
  String dropdownValue = 'Other';
  AddProductViewModel viewModel = AddProductViewModel();

  @override
  Widget build(BuildContext context) {
    String productName = "";
    double productPrice = 0.0;
    String productDescription = "";
    String dropdownvalue = 'Other';
    File? image;
    File? cameraImage;
    File? storageImage;

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
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: const Text('Product Details',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 120),
                      child: image != null
                          ? Image.file(
                              image!,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            )
                          : Image.asset('assets/images/addfood.png'),
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
                      child: DropdownButton(
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
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Product Name';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              productName = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.card_giftcard_rounded),
                              contentPadding: const EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: 'Enter Product Name',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
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
                              prefixIcon: const Icon(Icons.edit_note_rounded),
                              contentPadding: const EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: 'Enter Product Description',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    double.tryParse(value) == null ||
                                    double.parse(value) < 0) {
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
                                    borderRadius: BorderRadius.circular(30)),
                                hintText: 'Enter Product Price',
                              ),
                              keyboardType: TextInputType.number),
                          const SizedBox(height: 20),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 45),
                              child: const Text(
                                'Choose Product Image:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 110, 110, 110)),
                              )),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: 11,
                                child: OutlinedButton.icon(
                                  onPressed: () async {
                                    storageImage = await viewModel.selectImageStorage();
                                    setState(() => image = storageImage);
                                  },
                                  icon: const Icon(Icons.image_rounded, color: Colors.white),
                                  label: const Text(
                                    'Pick Gallery',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(10),
                                    side: BorderSide.none,
                                    backgroundColor: const Color.fromARGB(255, 200, 22, 112),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(flex: 2, child: SizedBox()),
                              Expanded(
                                flex: 11,
                                child: OutlinedButton.icon(
                                  onPressed: () async {
                                    cameraImage = await viewModel.selectImageCamera();
                                    setState(() => image = cameraImage);
                                  },
                                  icon: const Icon(Icons.camera_alt_rounded, color: Colors.white),
                                  label: const Text(
                                    'Pick Camera',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(10),
                                    side: BorderSide.none,
                                    backgroundColor: const Color.fromARGB(255, 77, 76, 76),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(35, 30, 35, 1),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (image == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please select an image")),
                              );
                              return;
                            }
                            try {
                              final String url = await viewModel.uploadImage(image!);
                              final double price = productPrice;
                              if (price < 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Invalid product price")),
                                );
                                return;
                              }
                              await viewModel.addProduct(
                                productName.trim(),
                                price,
                                productDescription.trim(),
                                dropdownvalue.trim(),
                                url,
                              );
                              Navigator.pushReplacementNamed(context, Routes.owner_mainpage);
                            } catch (e) {
                              debugPrint('Add product error: \$e');
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text("Add Product Error"),
                                  content: Text(e.toString()),
                                  actions: [
                                    TextButton(
                                      child: const Text("Close"),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 66, 170, 92),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                        ),
                        child: const Text(
                          'Add Product',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          side: BorderSide.none,
                          backgroundColor: const Color.fromARGB(255, 188, 34, 34),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })));
  }
}
