import 'package:flutter/material.dart';

import 'home.dart';

class HomeScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const HomeScreen());
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: const HomeAppBar(),
      body: HomeBody(),
    );
  }
}
