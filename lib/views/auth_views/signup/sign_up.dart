import 'package:cloud_firestore/cloud_firestore.dart';
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

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
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

  CollectionReference userRef = FirebaseFirestore.instance.collection(kUser);

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
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    CustomIconButton(
                      icon: Icons.arrow_back,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomTextStartUp(text: "Sign Up"),
                    SizedBox(height: 20.h),

                    CustomTextFormField(
                      controller: usernameController,
                      onChanged: (value) {
                        username = value;
                      },
                      hintText: 'Enter Your Username',
                      labelText: "UserName",
                    ),
                    SizedBox(height: 1.h),

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
                    SizedBox(height: 1.h), // fixed

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

                    SizedBox(height: 1.h), // fixed
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

                    SizedBox(height: 25.h),
                  ],
                ),
              ),
              CustomBottomContainer(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await registerUser();
                      Navigator.of(context).pushReplacementNamed(
                        LoginView.id,
                      );
                      usernameController.clear();
                      emailController.clear();
                      passwordController.clear();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        customSnackBar(context,
                            text: 'The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        customSnackBar(
                          context,
                          text: 'The account already exists for that email.',
                        );
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
                text: "Sign Up",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    await credential.user!.updateDisplayName(username);
    await userRef.doc(credential.user!.uid).set({
      kUserName: username ?? 'Anonymous',
      kEmail: email,
      kId: credential.user!.uid,
      kUserImage: credential.user!.photoURL ??
          'https://upload.wikimedia.org/wikipedia/commons/2/25/Siam_lilacpoint.jpg',
    });
  }
}
