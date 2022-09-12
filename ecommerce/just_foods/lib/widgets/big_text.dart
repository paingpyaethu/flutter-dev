// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:just_foods/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText(
      {Key? key,
      this.color = const Color(0xFF063F4B),
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: 'Kanit',
          color: color,
          fontSize: size == 0 ? Dimensions.fontSize20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
