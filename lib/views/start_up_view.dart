import 'package:e_commerce_app/views/start_first_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class StartUpView extends StatefulWidget {
  const StartUpView({super.key});
  static String id = 'StartUpView';

  @override
  State<StartUpView> createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  @override
  void initState() {
    FlutterNativeSplash.remove();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StartUpFirstView(),
    );
  }
}
