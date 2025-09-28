import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/views/lets_get_started_view.dart';
import 'package:e_commerce_app/widgets/gender_button.dart';
import 'package:flutter/material.dart';

class FirstViewContainer extends StatelessWidget {
  const FirstViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: 280,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Look Good, Feel Good",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Create your individual & unique style and look amazing everyday",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenderButton(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    LetsGetStartedView.id,
                  );
                },
                color: Colors.grey.shade100,
                gender: 'Men',
                textColor: Colors.blueGrey,
              ),
              GenderButton(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    LetsGetStartedView.id,
                  );
                },
                color: kPrimaryColor,
                gender: 'Women',
                textColor: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                LetsGetStartedView.id,
              );
            },
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
