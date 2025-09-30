import 'package:e_commerce_app/views/terms&conditions/terms_conditions_view.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "By connecting your account confirm that you agree",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "with our",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(TermsConditionsView.id);
              },
              child: Text(
                "   Term and Condition",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
