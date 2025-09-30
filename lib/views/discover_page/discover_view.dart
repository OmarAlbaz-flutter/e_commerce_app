import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/application_drawer.dart';
import 'package:e_commerce_app/views/discover_page/discover.dart';
import 'package:e_commerce_app/views/discover_page/discover_widget/discover_bottom_appbar.dart';
import 'package:flutter/material.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});
  static String id = 'DiscoverView';

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
