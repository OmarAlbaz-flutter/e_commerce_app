import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Container(
            height: 7.h,
            width: 14.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black.withAlpha(15),
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
