import 'package:e_commerce_app/views/forgot_password_view.dart';
import 'package:e_commerce_app/widgets/back_arrow_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/custom_text_startup.dart';
import 'package:e_commerce_app/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  String? username, password;
  bool isLoading = false;
  bool isChecked = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
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
                    text: "Welcome",
                  ),
                  Text('Please enter your data to contiue'),
                  SizedBox(height: 200),

                  // Username
                  CustomTextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter Your Username';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      username = value;
                      formKey.currentState!.validate();
                    },
                    hintText: 'Enter Your Username',
                    labelText: "UserName",
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ForgotPasswordView.id);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Remember me"),
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {});
                          isChecked = value!;
                        },
                        checkColor: Colors.green,
                        fillColor: WidgetStatePropertyAll(Colors.white),
                      ),
                    ],
                  ),

                  SizedBox(height: 150),
                  TermsAndConditions(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            CustomBottomContainer(
              onTap: () {
                if (formKey.currentState!.validate()) {}
              },
              text: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
