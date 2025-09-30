import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({
    super.key,
    required this.gender,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  final String gender;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.5.h),
        width: 35.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Center(
          child: Text(
            gender,
            style: TextStyle(
              color: textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
