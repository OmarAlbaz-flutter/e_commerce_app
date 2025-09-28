import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/widgets/login.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Login(),
    );
  }
}

