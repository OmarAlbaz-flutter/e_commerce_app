import 'package:e_commerce_app/views/discover_page/discover_widget/clothes_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ClothesListView extends StatelessWidget {
  const ClothesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ClothesCard();
          },
          childCount: 10,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.h,
          crossAxisSpacing: 1.h,
          childAspectRatio: 0.4,
        ),
      ),
    );
  }
}
