import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/widgets/sign_up.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static String id = 'SignUpView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SignUp(),
    );
  }
}
