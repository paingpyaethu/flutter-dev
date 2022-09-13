import 'package:flutter/material.dart';
import 'package:just_foods/utils/dimensions.dart';
import 'package:just_foods/widgets/app_column.dart';
import 'package:just_foods/widgets/app_icon.dart';
import 'package:just_foods/widgets/big_text.dart';
import 'package:just_foods/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';

class SliderFoodDetail extends StatelessWidget {
  const SliderFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height.toString());

    return Scaffold(
      body: Stack(children: [
        /*========== Background Image ==========*/
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/food-1.jpeg'))),
            )),
        /*========== Icon Widgets ==========*/
        Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios_new),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            )),
        /*========== Introduction of Food ==========*/
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: 'Grilled Shrimp',
                      fontSize: Dimensions.fontSize26,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: 'Introduce'),

                    /*===== Expandable Text Widget =====*/
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?'),
                      ),
                    ),
                  ],
                ))),
      ]),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        // height: 120,
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20, vertical: Dimensions.height30),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            )),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20, vertical: Dimensions.height15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
            ),
            child: Row(children: [
              Icon(
                Icons.remove,
                color: AppColors.signColor,
                size: Dimensions.iconSize24,
              ),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              BigText(text: '0'),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              Icon(
                Icons.add,
                color: AppColors.signColor,
                size: Dimensions.iconSize24,
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20, vertical: Dimensions.height15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.iconColor2),
            child: BigText(
              text: '\$10 | Add to Cart',
            ),
          )
        ]),
      ),
    );
  }
}
