import 'package:flutter/material.dart';
import 'package:karsome/app/app.dart';
import 'package:karsome/screens/main_page/main_page_viewmodel.dart';

// import 'main_page_viewmodel.dart';

class OwnerSideMenu extends StatefulWidget {
  const OwnerSideMenu({super.key});

  @override
  State<OwnerSideMenu> createState() => _OwnerSideMenuState();
}

MainPageViewModel viewmodel = MainPageViewModel();

class _OwnerSideMenuState extends State<OwnerSideMenu> {
  // Future userId = viewmodel.checkUser();
  //todo check user permission
  String status = "";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(222, 2, 97, 0.608),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hi!',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  //!TODO display username here
                  // FutureBuilder<DocumentSnapshot>(
                  //   future: viewmodel.getCurrentUser(),
                  //   builder: (context, AsyncSnapshot<DocumentSnapshot>snapshot),
                  // ),
                ]),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => {Navigator.pushNamed(context, Routes.profile)},
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add Product'),
            onTap: () =>
                {Navigator.pushNamed(context, Routes.owner_addProduct)},
          ),
          ListTile(
            leading: const Icon(Icons.fastfood_rounded),
            title: const Text('View products'),
            onTap: () =>
                {Navigator.pushNamed(context, Routes.owner_viewProduct)},
          ),
          ListTile(
              leading: const Icon(Icons.dashboard_customize_rounded),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pushNamed(context, Routes.owner_dashboard);
              }),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () async {
                status = await viewmodel.signOutUser();

                if (status == 'Signed Out') {
                  Navigator.pushNamed(context, Routes.homeRoute);
                }
              }),
        ],
      ),
    );
  }
}
