import 'package:e_commerce_app/cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/brands/brands_listview.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/clothes_listview_builder.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/discover_appbar.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/discover_search_bar.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/view_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).getCartItem();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                const DiscoverAppBar(),
                SizedBox(height: 3.h),
                Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "Welcome to ShopFlare",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 1.h),
                DiscoverSearchBar(),
                SizedBox(
                  height: 1.h,
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ViewAllWidget(
              leadingText: "Choose Brand",
              onTap: () {},
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 12.h,
            child: BrandListView(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 1.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ViewAllWidget(
              leadingText: "New Arrival",
              onTap: () {},
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 3.h,
          ),
        ),
        const ClothesListViewBuilder(),
      ],
    );
  }
}
