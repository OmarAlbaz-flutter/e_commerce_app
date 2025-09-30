import 'package:e_commerce_app/views/terms&conditions/terms_conditions.dart';
import 'package:flutter/material.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});
  static String id = 'TermsConditions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TermsConditions(),
    );
  }
}
