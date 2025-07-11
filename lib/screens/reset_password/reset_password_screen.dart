import 'package:flutter/material.dart';
import 'reset_password.dart';

class ResetPasswordScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ResetPassAppBar(),
      body: ResetPasswordPage(),
    );
  }
}
