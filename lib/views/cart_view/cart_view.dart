import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/views/cart_view/cart.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Cart(),
    );
  }
}
