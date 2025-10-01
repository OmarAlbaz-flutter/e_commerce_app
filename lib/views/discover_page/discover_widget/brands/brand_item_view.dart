import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/brands/brand_item.dart';
import 'package:flutter/material.dart';

class BrandItemView extends StatelessWidget {
  const BrandItemView({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
     
      body: BrandItem(productModel: productModel),
    );
  }
}
