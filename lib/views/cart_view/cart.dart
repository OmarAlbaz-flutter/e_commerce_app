import 'package:e_commerce_app/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:e_commerce_app/views/cart_view/cart_items_view.dart';
import 'package:e_commerce_app/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).getCartItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: CustomIconButton(
              icon: Icons.arrow_back,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: CartItemsView(),
          ),
        ],
      ),
    );
  }
}
