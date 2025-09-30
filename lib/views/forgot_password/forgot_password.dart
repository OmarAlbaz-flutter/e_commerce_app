import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/custom_snackbar.dart';
import 'package:e_commerce_app/views/auth_views/Login/login_view.dart';
import 'package:e_commerce_app/views/widgets/custom_icon_button.dart';
import 'package:e_commerce_app/views/widgets/custom_app_bottom_container.dart';
import 'package:e_commerce_app/views/widgets/custom_text_field.dart';
import 'package:e_commerce_app/views/startup_view/custom_text_startup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Column(
                    children: [
                      SizedBox(height: 5.h),
                      CustomIconButton(
                        icon: Icons.arrow_back,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const CustomTextStartUp(
                        text: "Forgot Password",
                      ),
                      Image.asset(
                        'assets/images/password.png',
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain,
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter Your Email';
                          }

                          final emailRegex =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value!)) {
                            return 'Enter a valid Email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                          formKey.currentState?.validate();
                        },
                        hintText: 'Enter Your Email',
                        labelText: 'Email Address',
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Please write your email to receive a confirmation code to set a new password.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 1.h),
                    ],
                  ),
                ),
                CustomBottomContainer(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() => isLoading = true);
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: emailController.text.trim(),
                        );

                        emailController.clear();

                        customSnackBar(
                          context,
                          text: "Password reset email sent! Check your inbox.",
                        );

                        Navigator.of(context)
                            .pushReplacementNamed(LoginView.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          customSnackBar(
                            context,
                            text:
                                "No account found with this email. Please sign up first.",
                          );
                        } else {
                          customSnackBar(
                            context,
                            text: e.message ?? "Something went wrong.",
                          );
                        }
                      } catch (e) {
                        customSnackBar(context, text: e.toString());
                      }
                      setState(() => isLoading = false);
                    }
                  },
                  text: "Confirm Mail",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
