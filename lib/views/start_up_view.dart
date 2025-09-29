import 'package:e_commerce_app/widgets/start_first_view.dart';
import 'package:flutter/material.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({super.key});
  static String id = 'StartUpView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StartUpFirstView(),
    );
  }
}
