import 'package:e_commerce_app/views/discover_view.dart';
import 'package:e_commerce_app/views/login_view.dart';
import 'package:e_commerce_app/views/sign_up_view.dart';
import 'package:e_commerce_app/widgets/back_arrow_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/widgets/custom_text_startup.dart';
import 'package:e_commerce_app/widgets/sign_up_methods_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LetsGetStarted extends StatelessWidget {
  const LetsGetStarted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              CustomTextStartUp(
                text: "Let's Get Started",
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
                onTap: () {
                  Navigator.pushReplacementNamed(context, DiscoverView.id);
                },
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
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        LoginView.id,
                      );
                    },
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
          onTap: () {
            Navigator.of(context).pushNamed(
              SignUpView.id,
            );
          },
          text: "Create an Account",
        ),
      ],
    );
  }
}
