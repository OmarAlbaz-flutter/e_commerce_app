import 'package:e_commerce_app/views/forgot_password_view.dart';
import 'package:e_commerce_app/views/lets_get_started_view.dart';
import 'package:e_commerce_app/views/login_view.dart';
import 'package:e_commerce_app/views/sign_up_view.dart';
import 'package:e_commerce_app/views/start_up_view.dart';
import 'package:e_commerce_app/views/terms_conditions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        StartUpView.id: (context) => StartUpView(),
        LetsGetStartedView.id: (context) => LetsGetStartedView(),
        SignUpView.id: (context) => SignUpView(),
        LoginView.id: (context) => LoginView(),
        TermsConditionsView.id: (context) => TermsConditionsView(),
        ForgotPasswordView.id: (context) => ForgotPasswordView(),
      },
      initialRoute: StartUpView.id,
    );
  }
}
