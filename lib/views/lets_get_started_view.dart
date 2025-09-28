import 'package:e_commerce_app/widgets/back_arrow_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/widgets/sign_up_methods_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LetsGetStartedView extends StatelessWidget {
  const LetsGetStartedView({super.key});
  static String id = 'LetsGetStarted';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                BackArrowWidget(),
                Text(
                  "Let's Get Started",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                SignUpMethodsContainer(
                  onTap: () {},
                  containerColor: Color(0xff4267b2),
                  icon: FontAwesomeIcons.facebookF,
                  text: "Facebook",
                ),
                SizedBox(
                  height: 10,
                ),
                SignUpMethodsContainer(
                  onTap: () {},
                  containerColor: Color(0xff1da1f2),
                  icon: FontAwesomeIcons.twitter,
                  text: "Twitter",
                ),
                SizedBox(
                  height: 10,
                ),
                SignUpMethodsContainer(
                  onTap: () {},
                  containerColor: Color(0xffeb4235),
                  icon: FontAwesomeIcons.google,
                  text: "Google",
                ),
                SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        " Signin",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomBottomContainer(
            onTap: () {},
            text: "Create an Account",
          ),
        ],
      ),
    );
  }
}
