import 'package:e_commerce_app/views/discover_page/discover_view.dart';
import 'package:e_commerce_app/views/auth_views/Login/login_view.dart';
import 'package:e_commerce_app/views/auth_views/signup/sign_up_view.dart';
import 'package:e_commerce_app/views/widgets/custom_icon_button.dart';
import 'package:e_commerce_app/views/widgets/custom_app_bottom_container.dart';
import 'package:e_commerce_app/views/startup_view/custom_text_startup.dart';
import 'package:e_commerce_app/views/auth_views/signup/sign_up_methods_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class LetsGetStarted extends StatelessWidget {
  const LetsGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                CustomIconButton(
                  icon: Icons.arrow_back,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                CustomTextStartUp(
                  text: "Let's Get Started",
                ),
                SizedBox(height: 21.h),
                SignUpMethodsContainer(
                  onTap: () {},
                  containerColor: const Color(0xff4267b2),
                  icon: FontAwesomeIcons.facebookF,
                  text: "Facebook",
                ),
                SizedBox(height: 1.h),
                SignUpMethodsContainer(
                  onTap: () {},
                  containerColor: const Color(0xff1da1f2),
                  icon: FontAwesomeIcons.twitter,
                  text: "Twitter",
                ),
                SizedBox(height: 1.h),
                SignUpMethodsContainer(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, DiscoverView.id);
                  },
                  containerColor: const Color(0xffeb4235),
                  icon: FontAwesomeIcons.google,
                  text: "Google",
                ),
                SizedBox(height: 21.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(LoginView.id);
                      },
                      child: Text(
                        " Signin",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomBottomContainer(
            onTap: () {
              Navigator.of(context).pushNamed(SignUpView.id);
            },
            text: "Create an Account",
          ),
        ],
      ),
    );
  }
}
