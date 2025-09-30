import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignUpMethodsContainer extends StatelessWidget {
  const SignUpMethodsContainer({
    super.key,
    required this.containerColor,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final Color containerColor;
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 8.5.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(16.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 18.sp,
            ),
            SizedBox(
              width: 10.sp,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
