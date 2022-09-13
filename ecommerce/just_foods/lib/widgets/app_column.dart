import 'package:flutter/material.dart';
import 'package:just_foods/widgets/big_text.dart';
import 'package:just_foods/widgets/icon_and_text.dart';
import 'package:just_foods/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final double fontSize;
  const AppColumn({Key? key, required this.text, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: text,
        size: fontSize,
      ),
      SizedBox(height: Dimensions.height10),
      Row(
        children: [
          Wrap(
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.star,
                      color: AppColors.mainColor,
                      size: Dimensions.iconSize15,
                    )),
          ),
          SizedBox(
            width: Dimensions.width10,
          ),
          SmallText(text: '4.5'),
          SizedBox(
            width: Dimensions.width10,
          ),
          SmallText(text: '1287 comments'),
        ],
      ),
      SizedBox(
        height: Dimensions.height15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconAndText(
              icon: Icons.circle_sharp,
              text: 'Normal',
              iconColor: AppColors.iconColor1),
          IconAndText(
              icon: Icons.location_on,
              text: '1.7km',
              iconColor: AppColors.iconColor2),
          IconAndText(
              icon: Icons.timer_sharp,
              text: '32min',
              iconColor: AppColors.iconColor3),
        ],
      )
    ]);
  }
}
