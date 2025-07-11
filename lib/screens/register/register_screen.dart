import 'package:flutter/material.dart';

import 'register_body.dart';

class RegisterScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const RegisterScreen());
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegistrationPage();
  }
}
