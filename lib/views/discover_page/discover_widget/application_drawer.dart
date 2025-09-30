import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/drawe_item_model.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/custom_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final List<DrawerItem> drawerItemList = [
    DrawerItem(text: 'Dark Mode', icon: Icons.wb_sunny_outlined, onTap: () {}),
    DrawerItem(
        text: 'Account Information', icon: Icons.error_outline, onTap: () {}),
    DrawerItem(text: 'Password', icon: Icons.lock_outline, onTap: () {}),
    DrawerItem(
        text: 'Order', icon: Icons.shopping_basket_outlined, onTap: () {}),
    DrawerItem(
        text: 'My Cards', icon: Icons.wallet_giftcard_outlined, onTap: () {}),
    DrawerItem(text: 'Wishlist', icon: FontAwesomeIcons.heart, onTap: () {}),
    DrawerItem(text: 'Settings', icon: Icons.settings_outlined, onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      backgroundColor: kSecondaryColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w), // ✅ better than sp
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button
              Container(
                height: 7.h,
                width: 14.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black.withAlpha(15),
                ),
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 3.h),

              // User profile
              Row(
                children: [
                  CircleAvatar(
                    radius: 24.sp,
                    backgroundImage:
                        const AssetImage("assets/images/startup_image.png"),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Text(
                      user?.displayName ?? 'Anonymous',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),

              // Drawer items
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
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

              // Logout
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
                onTap: () => FirebaseAuth.instance.signOut(),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
