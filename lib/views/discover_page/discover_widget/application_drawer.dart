import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/drawe_item_model.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/custom_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    super.key,
  });
  final List<DrawerItem> drawerItemList = [
    DrawerItem(
      text: 'Dark Mode',
      icon: Icons.wb_sunny_outlined,
      onTap: () {},
    ),
    DrawerItem(
      text: 'Account Information',
      icon: Icons.error_outline,
      onTap: () {},
    ),
    DrawerItem(
      text: 'Password',
      icon: Icons.lock_outline,
      onTap: () {},
    ),
    DrawerItem(
      text: 'Order',
      icon: Icons.shopping_basket_outlined,
      onTap: () {},
    ),
    DrawerItem(
      text: 'My Cards',
      icon: Icons.wallet_giftcard_outlined,
      onTap: () {},
    ),
    DrawerItem(
      text: 'Wishlist',
      icon: FontAwesomeIcons.heart,
      onTap: () {},
    ),
    DrawerItem(
      text: 'Settings',
      icon: Icons.settings_outlined,
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kSecondaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.black.withAlpha(15),
                ),
                child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.barsStaggered,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        AssetImage("assets/images/startup_image.png"),
                  ),
                  SizedBox(width: 12),
                  Text(
                    FirebaseAuth.instance.currentUser!.displayName ??
                        'Anonymous',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: drawerItemList.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      text: drawerItemList[index].text,
                      icon: drawerItemList[index].icon,
                      onTap: drawerItemList[index].onTap,
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
