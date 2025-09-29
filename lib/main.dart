import 'package:e_commerce_app/views/discover_view.dart';
import 'package:e_commerce_app/views/forgot_password_view.dart';
import 'package:e_commerce_app/views/lets_get_started_view.dart';
import 'package:e_commerce_app/views/login_view.dart';
import 'package:e_commerce_app/views/reset_password_view.dart';
import 'package:e_commerce_app/views/sign_up_view.dart';
import 'package:e_commerce_app/views/start_up_view.dart';
import 'package:e_commerce_app/views/terms_conditions_view.dart';
import 'package:e_commerce_app/views/verification_code_view.dart';
import 'package:e_commerce_app/widgets/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        VerificationCodeView.id: (context) => VerificationCodeView(),
        ResetPasswordView.id: (context) => ResetPasswordView(),
        DiscoverView.id : (context)=> DiscoverView(),
      },
      home: AuthWrapper(),
    );
  }
}
