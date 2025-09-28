import 'package:e_commerce_app/helper/sweep_gradient.dart';
import 'package:e_commerce_app/widgets/first_view_container.dart';
import 'package:flutter/material.dart';

class StartUpFirstView extends StatelessWidget {
  const StartUpFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: sweepGraientMethod(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/startup_image.png',
            height: 500,
            width: 500,
            fit: BoxFit.cover,
          ),
          FirstViewContainer(),
        ],
      ),
    );
  }
}
