import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, {required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryColor,
      content: Center(
        child: Text(
          text,
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
