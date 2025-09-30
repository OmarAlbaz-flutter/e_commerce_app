import 'package:e_commerce_app/helper/custom_snackbar.dart';
import 'package:e_commerce_app/views/login_view.dart';
import 'package:e_commerce_app/widgets/custom_icon_button.dart';
import 'package:e_commerce_app/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/custom_text_startup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
  bool isLoading = false;
  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Form(
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
                    CustomIconButton(
                      icon: Icons.arrow_back,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
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
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text.trim(),
                      );

                      // Clear textfield
                      emailController.clear();

                      // Show success message
                      customSnackBar(
                        context,
                        text: "Password reset email sent! Check your inbox.",
                      );

                      Navigator.of(context).pushReplacementNamed(LoginView.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        customSnackBar(context,
                            text: "No user found for that email.");
                      } else {
                        customSnackBar(context,
                            text: e.message ?? "Something went wrong.");
                      }
                    } catch (e) {
                      customSnackBar(context, text: e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  }
                },
                text: "Confirm Mail",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
