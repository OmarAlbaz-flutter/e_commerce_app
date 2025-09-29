import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/widgets/application_drawer.dart';
import 'package:e_commerce_app/widgets/discover.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});
  static String id = 'DiscoverView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                FontAwesomeIcons.barsStaggered,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: AppDrawer(),
      body: const Discover(),
    );
  }
}

