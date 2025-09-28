import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/widgets/verification_code.dart';
import 'package:flutter/material.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});
  static String id = 'VerificationCode';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: VerificationCode(),
    );
  }
}
