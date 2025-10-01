import 'package:e_commerce_app/cubit/products_cubit/products_cubit_cubit.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/clothes_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ClothesListView extends StatelessWidget {
  const ClothesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverCubitState>(
      builder: (context, state) {
        if (state is DiscoverCubitSuccess) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = state.products[index];
                  return ClothesCard(productModel: product);
                },
                childCount: state.products.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1.h,
                crossAxisSpacing: 1.h,
                childAspectRatio: 0.55,
              ),
            ),
          );
        } else if (state is DiscoverCubitLoading) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Skeletonizer(
                    enabled: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2.w),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Container(
                          height: 2.h,
                          width: 60.w,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: 0.5.h),
                        Container(
                          height: 2.h,
                          width: 30.w,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  );
                },
                childCount: 6, 
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1.h,
                crossAxisSpacing: 1.h,
                childAspectRatio: 0.55,
              ),
            ),
          );
        } else if (state is DiscoverCubitFailure) {
          return SliverFillRemaining(
            child: Center(child: Text('Failed: ${state.errMessage}')),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(child: Text("No data")),
          );
        }
      },
    );
  }
}
