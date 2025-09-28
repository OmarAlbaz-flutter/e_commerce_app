import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/widgets/reset_password.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static String id = 'ResetPassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: ResetPassword(),
    );
  }
}
