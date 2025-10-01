import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Row(
            children: [
              CustomIconButton(
                icon: Icons.arrow_back,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                width: 1.w,
              ),
              Text(
                productModel.category,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Stack(children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(6.w),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.w),
                  child: Image.network(
                    productModel.image,
                    height: 35.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 4.w,
              right: 12.w,
              child: IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.black54),
                onPressed: () {},
              ),
            ),
          ]),
          SizedBox(height: 3.h),
          Text(
            productModel.title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            "\$${productModel.price}",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            productModel.description,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.w),
                ),
                backgroundColor: kPrimaryColor,
                foregroundColor: kSecondaryColor,
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
