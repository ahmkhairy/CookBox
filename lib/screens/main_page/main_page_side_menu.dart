import 'package:flutter/material.dart';
import 'package:karsome/app/app.dart';
import 'package:karsome/helper/navigationHelper.dart';
import 'package:karsome/screens/address/address_view.dart';

import 'main_page_viewmodel.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

MainPageViewModel viewmodel = MainPageViewModel();

class _SideMenuState extends State<SideMenu> {
  // Future userId = viewmodel.checkUser();
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
            leading: const Icon(Icons.home),
            title: const Text('Address'),
            onTap: () =>
                {NavigationHelper.pushRoute(context, const AddressView())},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () =>
                {Navigator.pushNamed(context, Routes.customer_history)},
          ),
          // ListTile(
          //     leading: Icon(Icons.email_outlined),
          //     title: Text('Email support'),
          //     onTap: () {
          //       Navigator.pushNamed(context, Routes.support_email);
          //     }),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () async {
                status = await viewmodel.signOutUser();

                if (status == 'Signed Out') {
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                }
              }),
        ],
      ),
    );
  }
}
