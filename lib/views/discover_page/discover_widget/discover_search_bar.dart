import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DiscoverSearchBar extends StatelessWidget {
  const DiscoverSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.grey),
                hintText: "Search...",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 4.w),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.mic,
            color: Colors.white,
            size: 6.w,
          ),
        ),
      ],
    );
  }
}
