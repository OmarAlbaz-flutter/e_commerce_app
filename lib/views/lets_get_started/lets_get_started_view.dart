import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/views/lets_get_started/lets_get_started.dart';
import 'package:flutter/material.dart';

class LetsGetStartedView extends StatelessWidget {
  const LetsGetStartedView({super.key});
  static String id = 'LetsGetStarted';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: LetsGetStarted(),
    );
  }
}
