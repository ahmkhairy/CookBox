import 'package:flutter/material.dart';
import 'package:karsome/helper/navigationHelper.dart';
import 'package:karsome/screens/food_detail/layout/widgets/food_detail_future.dart';
import 'package:karsome/screens/owner/view_product/view_product_view_model.dart';
import 'package:karsome/app/routes.dart';

class FoodBuilderFuture extends StatefulWidget {
  const FoodBuilderFuture({super.key});

  @override
  State<FoodBuilderFuture> createState() => _FoodBuilderFutureState();
}

ViewProductViewModel viewModel = ViewProductViewModel();

class _FoodBuilderFutureState extends State<FoodBuilderFuture> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Menu Items',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            TextButton.icon(
              icon: const Text(
                'View All',
                style: TextStyle(
                  color: Color.fromRGBO(222, 2, 97, 0.608),
                  fontSize: 13,
                ),
              ),
              label: const Icon(Icons.keyboard_arrow_right),
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.customer_product_list),
            ),
          ],
        ),
        const SizedBox(height: 10),

        FutureBuilder<List<dynamic>?>(
          future: viewModel.getMainDishProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("Error loading menu: ${snapshot.error}"),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No main dishes available."));
            }

            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];

                // Ensure price is double for formatting
                double price = 0.0;
                try {
                  if (item.productPrice is int) {
                    price = (item.productPrice as int).toDouble();
                  } else if (item.productPrice is double) {
                    price = item.productPrice;
                  } else if (item.productPrice is String) {
                    price = double.tryParse(item.productPrice) ?? 0.0;
                  }
                } catch (_) {
                  price = 0.0;
                }

                return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Color.fromARGB(179, 219, 219, 219), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    splashColor: const Color.fromARGB(255, 254, 223, 188),
                    onTap: () {
                      NavigationHelper.pushRoute(
                        context,
                        FoodDetailViewFuture(
                          productName: item.productName.toString(),
                          productPrice: price.toStringAsFixed(2),
                          url: item.url.toString(),
                          productDescription:
                              item.productDescription.toString(),
                          category: item.category.toString(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        children: [
                          // Image
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Center(
                                child: Image.network(
                                  item.url,
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          // Info
                          Expanded(
                            flex: 5,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.productName ?? "Unnamed item",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item.productDescription ??
                                          "No description",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 87, 87, 87),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'MYR ${price.toStringAsFixed(2)}',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
