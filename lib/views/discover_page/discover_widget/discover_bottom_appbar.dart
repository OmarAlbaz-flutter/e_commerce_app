import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DiscoverBottomAppBar extends StatelessWidget {
  const DiscoverBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Favorite
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Icon(Icons.favorite_outline,
                    color: Colors.black, size: 20.sp),
              ),
            ),

            // Basket
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Icon(Icons.shopping_basket_outlined,
                    color: Colors.black, size: 20.sp),
              ),
            ),

            // Giftcard
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Icon(Icons.wallet_giftcard_outlined,
                    color: Colors.black, size: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
