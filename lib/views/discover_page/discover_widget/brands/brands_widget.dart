import 'package:e_commerce_app/cubit/products_cubit/products_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class BrandsWidget extends StatelessWidget {
  const BrandsWidget({
    super.key,
    required this.name,
    required this.icon,
  });

  final dynamic name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cubit = context.read<DiscoverCubit>();

        if (cubit.selectedCategory == name) {
          cubit.fetchAll();
        } else {
          cubit.fetchProductsByCategory(name);
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 5.w, top: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 5.h,
              width: 12.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 20.sp,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(width: 2.w),
            Text(
              name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
