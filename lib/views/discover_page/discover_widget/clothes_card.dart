import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ClothesCard extends StatelessWidget {
  const ClothesCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(4.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(2.w),
                ),
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(2.w),
                  child: Image.network(
                    productModel.image,
                    fit: BoxFit.contain,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
              Positioned(
                top: 2.w,
                right: 2.w,
                child: IconButton(
                  icon:
                      const Icon(Icons.favorite_border, color: Colors.black54),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            productModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            "\$${productModel.price}",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
