import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/cubit/user_cubit/user_cubit.dart';
import 'package:e_commerce_app/models/drawe_item_model.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/custom_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Drawer(
      backgroundColor: kSecondaryColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return CircularProgressIndicator();
                  } else if (state is UserSuccess) {
                    final userModel = state.userModel;
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 24.sp,
                          backgroundImage: NetworkImage(
                            userModel.image,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: Text(
                            userModel.userName,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Text("No user data");
                  }
                },
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
