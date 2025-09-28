import 'package:e_commerce_app/widgets/back_arrow_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/custom_text_startup.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  String? password, rePassword;
  bool isLoading = false;
  bool isChecked = false;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  BackArrowWidget(),
                  CustomTextStartUp(
                    text: "New Password",
                  ),
                  SizedBox(height: 250),

                  SizedBox(
                    height: 10,
                  ),
                  // Password
                  CustomTextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter Your Password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      password = value;
                      formKey.currentState!.validate();
                    },
                    obscureText: true,
                    hintText: 'Enter Your Password',
                    labelText: 'Password',
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  // Confirm Password
                  CustomTextFormField(
                    controller: rePasswordController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Repeat Your Password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      rePassword = value;
                      formKey.currentState!.validate();
                    },
                    obscureText: true,
                    hintText: 'Repeat Your Password',
                    labelText: "Confirm Password",
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(height: 250),
                ],
              ),
            ),
            CustomBottomContainer(
              onTap: () {
                if (formKey.currentState!.validate()) {}
              },
              text: "Reset Password",
            ),
          ],
        ),
      ),
    );
  }
}
