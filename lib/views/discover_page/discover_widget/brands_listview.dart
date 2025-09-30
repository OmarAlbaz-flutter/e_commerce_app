import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../models/brand_model.dart';

class BrandListView extends StatelessWidget {
  BrandListView({super.key});

  final List<BrandModel> brands = [
    BrandModel(name: "Adidas", logo: "assets/images/brands/adidas.png"),
    BrandModel(name: "Nike", logo: "assets/images/brands/nike.png"),
    BrandModel(name: "Fila", logo: "assets/images/brands/fila.png"),
    BrandModel(name: "Puma", logo: "assets/images/brands/puma.png"),
    BrandModel(name: "Gucci", logo: "assets/images/brands/gucci.png"),
    BrandModel(name: "Louis Vuitton", logo: "assets/images/brands/lv.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      scrollDirection: Axis.horizontal,
      itemCount: brands.length,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(right: 5.w, top: 4.h),
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
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Image.asset(
                  brands[index].logo,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 2.w),
              Text(
                brands[index].name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
