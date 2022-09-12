// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:just_foods/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({
    Key? key,
    this.color = const Color(0xFF888989),
    required this.text,
    this.size = 0,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Kanit',
        color: color,
        fontSize: size == 0 ? Dimensions.fontSize12 : size,
        height: height,
      ),
    );
  }
}
