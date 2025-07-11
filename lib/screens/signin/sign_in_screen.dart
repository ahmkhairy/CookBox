import 'package:flutter/material.dart';
import 'sign_in.dart';

class SignInScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const SignInScreen());
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignIn();
  }
}
