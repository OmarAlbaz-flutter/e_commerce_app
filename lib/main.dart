import 'package:e_commerce_app/cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/cubit/products_cubit/products_cubit_cubit.dart';
import 'package:e_commerce_app/cubit/user_cubit/user_cubit.dart';
import 'package:e_commerce_app/services/auth_wrapper.dart';
import 'package:e_commerce_app/views/auth_views/Login/login_view.dart';
import 'package:e_commerce_app/views/auth_views/signup/sign_up_view.dart';
import 'package:e_commerce_app/views/discover_page/discover_view.dart';
import 'package:e_commerce_app/views/forgot_password/forgot_password_view.dart';
import 'package:e_commerce_app/views/lets_get_started/lets_get_started_view.dart';
import 'package:e_commerce_app/views/startup_view/start_up_view.dart';
import 'package:e_commerce_app/views/terms&conditions/terms_conditions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DiscoverCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => UserCubit()),
      ],
      child: Sizer(
        builder: (context, orientation, screenType) {
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
              DiscoverView.id: (context) => DiscoverView(),
            },
            home: AuthWrapper(),
          );
        },
      ),
    );
  }
}
