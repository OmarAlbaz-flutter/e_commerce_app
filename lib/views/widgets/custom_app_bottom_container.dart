import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBottomContainer extends StatelessWidget {
  const CustomBottomContainer({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        height: 12.h,
        width: double.infinity,
        color: kPrimaryColor,
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
