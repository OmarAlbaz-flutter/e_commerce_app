import 'package:e_commerce_app/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscoverAppBar extends StatelessWidget {
  const DiscoverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: FontAwesomeIcons.barsStaggered,
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        CustomIconButton(
          icon: Icons.shopping_basket_outlined,
          onTap: () {},
        )
      ],
    );
  }
}
