import 'package:flutter/widgets.dart';

class DrawerItem {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  DrawerItem({
    required this.text,
    required this.icon,
    required this.onTap,
  });
}
