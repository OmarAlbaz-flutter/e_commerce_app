import 'package:flutter/material.dart';

class DiscoverBottomAppBar extends StatelessWidget {
  const DiscoverBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            // Home
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Favorite
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.favorite_outline, color: Colors.black),
              ),
            ),

            // Basket
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(8),
                child:
                    Icon(Icons.shopping_basket_outlined, color: Colors.black),
              ),
            ),

            // Giftcard
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(8),
                child:
                    Icon(Icons.wallet_giftcard_outlined, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
