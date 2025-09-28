import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/widgets/forgot_password.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static String id = 'ForgotPasswordView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: ForgotPassword(),
    );
  }
}
