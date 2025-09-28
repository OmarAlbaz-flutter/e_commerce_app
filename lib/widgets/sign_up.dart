import 'package:e_commerce_app/widgets/back_arrow_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/custom_text_startup.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? username, password, email;
  bool isLoading = false;
  bool isChecked = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
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
                  const SizedBox(height: 80),
                  const BackArrowWidget(),
                  const CustomTextStartUp(text: "Sign Up"),
                  const SizedBox(height: 200),

                  // Username
                  CustomTextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter Your Username';
                      }
                      return null;
                    },
                    onChanged: (value) => username = value,
                    hintText: 'Username',
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
                    onChanged: (value) => password = value,
                    obscureText: true,
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Email
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter Your Email';
                      }
                      return null;
                    },
                    onChanged: (value) => email = value,
                    hintText: 'Email Address',
                  ),
                  SizedBox(
                    height: 10,
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

                  SizedBox(height: 200),
                ],
              ),
            ),
            CustomBottomContainer(
              onTap: () {},
              text: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}
