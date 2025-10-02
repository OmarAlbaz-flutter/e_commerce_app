import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/cubit/products_cubit/products_cubit_cubit.dart';
import 'package:e_commerce_app/cubit/user_cubit/user_cubit.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/application_drawer.dart';
import 'package:e_commerce_app/views/discover_page/discover.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/discover_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});
  static String id = 'DiscoverView';

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  @override
  void initState() {
    BlocProvider.of<DiscoverCubit>(context).fetchAll();
    BlocProvider.of<UserCubit>(context).getUserData();
    BlocProvider.of<CartCubit>(context).getCartItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      drawer: AppDrawer(),
      bottomNavigationBar: DiscoverBottomAppBar(),
      body: const Discover(),
    );
  }
}
