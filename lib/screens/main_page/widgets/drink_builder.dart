// import 'package:flutter/material.dart';
// import 'package:karsome/helper/navigationHelper.dart';
// import 'package:karsome/infrastructure/models/drink_model.dart';
// import 'package:karsome/infrastructure/services/productServices.dart';
// import 'package:karsome/screens/food_detail/food_detail.dart';
// import 'package:karsome/screens/main_page/widgets/main_dish.dart';
// import 'package:karsome/widgets/shimmer_widget.dart';
// import 'package:provider/provider.dart';

// class DrinkBuilder extends StatelessWidget {
//   const DrinkBuilder({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ProductServices services = ProductServices();
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Menu Items',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Text(
//                   'Check all',
//                   style: TextStyle(color: Colors.orange, fontSize: 12),
//                 ),
//                 Icon(Icons.keyboard_arrow_right)
//               ],
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 30,
//         ),
//         StreamProvider.value(
//           initialData: [DrinkModel()],
//           value: services.streamDrinkPost(),
//           builder: (context, child) {
//             List<DrinkModel> drink = context.watch<List<DrinkModel>>();
//             return Container(
//               height: MediaQuery.of(context).size.height / 2.5,
//               child: ListView.builder(
//                   itemCount: drink.length,
//                   physics: BouncingScrollPhysics(),
//                   itemBuilder: (context, i) {
//                     if (drink[i].image != null) {
//                       return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: GestureDetector(
//                               onTap: () {
//                                 NavigationHelper.pushRoute(
//                                     context,
//                                     FoodDetailView(
//                                       name: drink[i].drinkName.toString(),
//                                       price: drink[i].price!,
//                                       image: drink[i].image.toString(),
//                                       decription: drink[i].desc.toString(),
//                                     ));
//                               },
//                               child: MainDish(
//                                   img: drink[i].image.toString(),
//                                   fullName: drink[i].desc.toString(),
//                                   name: drink[i].drinkName.toString(),
//                                   price: drink[i].price!)));
//                     } else {
//                       return ShimmerWidget();
//                     }
//                   }),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
