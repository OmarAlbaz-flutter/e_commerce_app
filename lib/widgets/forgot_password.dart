import 'package:e_commerce_app/widgets/back_arrow_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/custom_text_startup.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  String? email;
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
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
                    text: "Forgot Password",
                  ),
                  Image.asset(
                    'assets/images/password.png',
                    height: 330,
                    width: 330,
                    fit: BoxFit.contain,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter Your Email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      email = value;
                      formKey.currentState!.validate();
                    },
                    hintText: 'Enter Your Email',
                    labelText: 'Email Address',
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Please write your email to receive a confirmation code to set a new password.",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            CustomBottomContainer(
              onTap: () {},
              text: "Confirm Mail",
            ),
          ],
        ),
      ),
    );
  }
}
