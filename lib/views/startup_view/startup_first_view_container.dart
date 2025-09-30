import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/views/lets_get_started/lets_get_started_view.dart';
import 'package:e_commerce_app/views/startup_view/gender_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FirstViewContainer extends StatelessWidget {
  const FirstViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Look Good, Feel Good",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 1.h),
          Text(
            "Create your individual & unique style and look amazing everyday",
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GenderButton(
                onTap: () {
                  Navigator.of(context).pushNamed(LetsGetStartedView.id);
                },
                color: Colors.grey.shade100,
                gender: 'Men',
                textColor: Colors.blueGrey,
              ),
              GenderButton(
                onTap: () {
                  Navigator.of(context).pushNamed(LetsGetStartedView.id);
                },
                color: kPrimaryColor,
                gender: 'Women',
                textColor: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 2.h),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(LetsGetStartedView.id);
            },
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
