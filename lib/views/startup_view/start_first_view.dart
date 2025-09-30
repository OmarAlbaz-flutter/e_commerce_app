import 'package:e_commerce_app/helper/sweep_gradient.dart';
import 'package:e_commerce_app/views/startup_view/startup_first_view_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StartUpFirstView extends StatelessWidget {
  const StartUpFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: sweepGraientMethod(),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/startup_image.png',
                height: 50.h,
                fit: BoxFit.cover,
              ),
              FirstViewContainer(),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
