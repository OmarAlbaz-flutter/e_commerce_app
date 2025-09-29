import 'package:e_commerce_app/helper/custom_snackbar.dart';
import 'package:e_commerce_app/views/forgot_password_view.dart';
import 'package:e_commerce_app/widgets/back_arrow_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/custom_text_startup.dart';
import 'package:e_commerce_app/widgets/terms_and_conditions_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  String? email, password;
  bool isLoading = false;
  bool isChecked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Form(
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
                      labelText: "Email Address",
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
                            isChecked = value!;
                            setState(() {});
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
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await loginUser();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      emailController.clear();
                      passwordController.clear();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        customSnackBar(context,
                            text: 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        customSnackBar(context,
                            text: 'Wrong password provided for that user.');
                      }
                    } catch (e) {
                      customSnackBar(context, text: e.toString());
                    }

                    isLoading = false;
                    setState(() {});
                  } else {
                    return;
                  }
                },
                text: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
