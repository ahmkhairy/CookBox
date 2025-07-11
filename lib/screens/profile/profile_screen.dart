import 'package:flutter/material.dart';
import 'profile.dart';

class ProfileScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const ProfileScreen());
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProfileAppBar(),
      body: ProfilePage(),
    );
  }
}
