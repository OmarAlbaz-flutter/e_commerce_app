import 'package:flutter/material.dart';

class CustomTextStartUp extends StatelessWidget {
  const CustomTextStartUp({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }
}
