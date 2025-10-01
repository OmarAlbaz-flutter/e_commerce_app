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

          /// 🔹 Top row with Back & Cart icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: Icons.arrow_back,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              CustomIconButton(
                icon: Icons.shopping_bag_outlined,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 3.h),

          /// 🔹 Product Image (with fav button inside stack)
          Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(14.w),
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
                top: 2.h,
                right: 12.w,
                child: CustomIconButton(
                  icon: Icons.favorite_border,
                  onTap: () {},
                ),
              ),
            ],
          ),

          SizedBox(height: 3.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  productModel.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "\$${productModel.price}",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          SizedBox(height: 3.h),

          Text(
            "Description",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            productModel.description,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
          ),

          SizedBox(height: 3.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reviews",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/startup_image.png"),
            ),
            title: Text("Ronald Richards"),
            subtitle: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elite and ",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${productModel.rating?.rate ?? 'N/A'} ⭐",
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  "Ratings: ${productModel.rating?.count ?? 'N/A'}",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
          ),

          SizedBox(height: 3.h),

          /// 🔹 Total Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Price (incl. VAT)",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
              ),
              Text(
                "\$${productModel.price + 5}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 3.h),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 1.8.h),
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
