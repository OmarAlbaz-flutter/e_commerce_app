import 'package:e_commerce_app/widgets/back_arrow_widget.dart';
import 'package:e_commerce_app/widgets/code_boxes_widget.dart';
import 'package:e_commerce_app/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/widgets/custom_text_startup.dart';
import 'package:flutter/material.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  text: "Verification Code",
                ),
                Image.asset(
                  'assets/images/password.png',
                  height: 330,
                  width: 330,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 20,
                ),
                CodeBoxesWidget(),
                SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("00:20"),
                    Text(
                      textAlign: TextAlign.center,
                      "resend confirmation code.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          CustomBottomContainer(
            onTap: () {},
            text: "Confirm Code",
          ),
        ],
      ),
    );
  }
}
