// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:karsome/screens/main_page/main_page.dart';
// import 'package:karsome/screens/main_page/widgets/dessert_builder_future.dart';
// import 'package:karsome/screens/main_page/widgets/drink_builder_future.dart';
// import 'package:karsome/screens/main_page/widgets/food_builder_future.dart';
// import 'package:karsome/screens/owner/owner_dashboard/owner_dashboard_view_model.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// DashboardViewModel statusViewModel = DashboardViewModel();
// int selectIndex = 1;

// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: statusViewModel.status,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Please connect to the internet'),
//             );
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           print(snapshot.connectionState);
//           final data = snapshot.requireData;
//           print(data);

//           if (data.docs[0]['isOpen'] == true) {
//             return SingleChildScrollView(
//               child: Container(
//                 margin: EdgeInsets.all(18),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MainPageHeader(),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color.fromARGB(255, 233, 233, 233),
//                             blurRadius: 4,
//                             offset: Offset(3, 3),
//                             spreadRadius: 4.5,
//                           ),
//                         ],
//                       ),
//                       height: 200,
//                       width: double.infinity,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: Image.asset(
//                           'assets/images/cookbox.png', // Your promo image path
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           cardWidget(1, 'assets/images/food.png', 'Main dish'),
//                           SizedBox(width: 40),
//                           cardWidget(2, 'assets/images/drink.png', 'Drinks'),
//                           SizedBox(width: 40),
//                           cardWidget(3, 'assets/images/sweets.png', 'Desserts'),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     if (selectIndex == 1) FoodBuilderFuture(),
//                     if (selectIndex == 2) DrinkBuilderFuture(),
//                     if (selectIndex == 3) DessertBuilderFuture(),
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return Container(
//                 margin: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Image.asset('assets/images/shopClosed.png'),
//                       Text(
//                         'Sorry, CookBox is closed now',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w500),
//                       )
//                     ]));
//           }
//         });
//   }

//   Widget cardWidget(int index, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectIndex = index;
//         });
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: selectIndex == index
//               ? Color.fromRGBO(222, 2, 97, 0.608)
//               : Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Color.fromARGB(255, 233, 233, 233),
//               blurRadius: 4,
//               offset: Offset(3, 3),
//               spreadRadius: 4.5,
//             ),
//           ],
//         ),
//         height: 170,
//         width: 200, // Increased the width of the cards
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//             Image.asset(
//               imagePath,
//               height: 50,
//               width: 50,
//             ),
//             SizedBox(height: 20),
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 19,
//                 color: selectIndex == index ? Colors.white : Colors.black,
//               ),
//             ),
//             SizedBox(height: 20),
//             CircleAvatar(
//               backgroundColor: Colors.white,
//               radius: 18,
//               child: Center(
//                 child: Icon(
//                   selectIndex == index
//                       ? Icons.keyboard_arrow_down_outlined
//                       : Icons.keyboard_arrow_right,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:karsome/screens/main_page/main_page.dart';
// import 'package:karsome/screens/main_page/widgets/dessert_builder_future.dart';
// import 'package:karsome/screens/main_page/widgets/drink_builder_future.dart';
// import 'package:karsome/screens/main_page/widgets/food_builder_future.dart';
// import 'package:karsome/screens/owner/owner_dashboard/owner_dashboard_view_model.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// DashboardViewModel statusViewModel = DashboardViewModel();
// int selectIndex = 1;

// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: statusViewModel.status,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Center(
//             child: Text('Please connect to the internet'),
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (!snapshot.hasData) {
//           return Center(
//             child: Text('No data available'),
//           );
//         }

//         try {
//           final data = snapshot.requireData;
//           if (data.docs.isEmpty) {
//             return Center(
//               child: Text('No documents found'),
//             );
//           }

//           // Validate that the document contains the expected fields
//           if (data.docs[0].data() is! Map<String, dynamic>) {
//             return Center(
//               child: Text('Invalid data format'),
//             );
//           }

//           if (data.docs[0]['isOpen'] == true) {
//             return SingleChildScrollView(
//               child: Container(
//                 margin: EdgeInsets.all(18),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MainPageHeader(),
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color.fromARGB(255, 233, 233, 233),
//                             blurRadius: 4,
//                             offset: Offset(3, 3),
//                             spreadRadius: 4.5,
//                           ),
//                         ],
//                       ),
//                       height: 200,
//                       width: double.infinity,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: Image.asset(
//                           'assets/images/promo.png', // Your promo image path
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           cardWidget(1, 'assets/images/food.png', 'Main dish'),
//                           SizedBox(width: 40),
//                           cardWidget(2, 'assets/images/drink.png', 'Drinks'),
//                           SizedBox(width: 40),
//                           cardWidget(3, 'assets/images/sweets.png', 'Desserts'),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 40),
//                     if (selectIndex == 1) FoodBuilderFuture(),
//                     if (selectIndex == 2) DrinkBuilderFuture(),
//                     if (selectIndex == 3) DessertBuilderFuture(),
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return Container(
//               margin: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset('assets/images/shopClosed.png'),
//                   Text(
//                     'Sorry, CookBox is closed now',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//             );
//           }
//         } catch (e) {
//           return Center(
//             child: Text('Error loading data: $e'),
//           );
//         }
//       },
//     );
//   }

//   Widget cardWidget(int index, String imagePath, String title) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectIndex = index;
//         });
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: selectIndex == index
//               ? Color.fromRGBO(222, 2, 97, 0.608)
//               : Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Color.fromARGB(255, 233, 233, 233),
//               blurRadius: 4,
//               offset: Offset(3, 3),
//               spreadRadius: 4.5,
//             ),
//           ],
//         ),
//         height: 170,
//         width: 200, // Increased the width of the cards
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//             Image.asset(
//               imagePath,
//               height: 50,
//               width: 50,
//             ),
//             SizedBox(height: 20),
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 19,
//                 color: selectIndex == index ? Colors.white : Colors.black,
//               ),
//             ),
//             SizedBox(height: 20),
//             CircleAvatar(
//               backgroundColor: Colors.white,
//               radius: 18,
//               child: Center(
//                 child: Icon(
//                   selectIndex == index
//                       ? Icons.keyboard_arrow_down_outlined
//                       : Icons.keyboard_arrow_right,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:karsome/screens/main_page/widgets/dessert_builder_future.dart';
import 'package:karsome/screens/main_page/widgets/drink_builder_future.dart';
import 'package:karsome/screens/main_page/widgets/food_builder_future.dart';
import 'package:karsome/screens/owner/owner_dashboard/owner_dashboard_view_model.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final DashboardViewModel statusViewModel = DashboardViewModel();
  int selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: statusViewModel.status,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // ✅ Handle error state
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // ✅ Handle loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // ✅ Handle no data case
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        try {
          final data = snapshot.requireData;
          final doc = data.docs.first.data();

          // ✅ Check for valid document data
          if (doc == null || doc is! Map<String, dynamic>) {
            return const Center(child: Text('Invalid data format'));
          }

          final isOpen = doc['isOpen'] ?? false;

          if (isOpen) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          cardWidget(1, 'assets/images/food.png', 'Main dish'),
                          const SizedBox(width: 40),
                          cardWidget(2, 'assets/images/drink.png', 'Drinks'),
                          const SizedBox(width: 40),
                          cardWidget(3, 'assets/images/sweets.png', 'Desserts'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (selectIndex == 1) const FoodBuilderFuture(),
                    if (selectIndex == 2) const DrinkBuilderFuture(),
                    if (selectIndex == 3) const DessertBuilderFuture(),
                  ],
                ),
              ),
            );
          } else {
            // ✅ When isOpen is false (closed shop)
            return Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/shopClosed.png'),
                    const SizedBox(height: 20),
                    const Text(
                      'Sorry, CookBox is closed now',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            );
          }
        } catch (e) {
          // ✅ Catch and show any unexpected parsing errors
          return Center(
            child: Text('Error loading data: $e'),
          );
        }
      },
    );
  }

  Widget cardWidget(int index, String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: selectIndex == index
              ? const Color.fromRGBO(222, 2, 97, 0.608)
              : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 233, 233, 233),
              blurRadius: 4,
              offset: Offset(3, 3),
              spreadRadius: 4.5,
            ),
          ],
        ),
        height: 170,
        width: 200,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset(imagePath, height: 50, width: 50),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: selectIndex == index ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child: Center(
                child: Icon(
                  selectIndex == index
                      ? Icons.keyboard_arrow_down_outlined
                      : Icons.keyboard_arrow_right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
