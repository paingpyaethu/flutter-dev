import 'package:flutter/material.dart';
import 'package:just_foods/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;

  AppIcon({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.iconSize = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(iconSize / 2),
          color: backgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize16,
      ),
    );
  }
}
