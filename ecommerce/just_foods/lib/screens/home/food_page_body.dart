import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:just_foods/utils/colors.dart';
import 'package:just_foods/utils/dimensions.dart';
import 'package:just_foods/widgets/app_column.dart';
import 'package:just_foods/widgets/big_text.dart';
import 'package:just_foods/widgets/icon_and_text.dart';
import 'package:just_foods/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
      // print('Current page value: ' + _currentPageValue.toString());
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*
        ==== Slider Section ====
        */
        Container(
          // color: Colors.red,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        /*
        ==== Dots ====
        */
        new DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeColor: AppColors.mainColor,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
        /*
        ==== Popular Text ====
        */
        SizedBox(
          height: Dimensions.height20,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width25),
          // color: Colors.amber,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height5),
                child: SmallText(text: 'Food Paring'),
              ),
            ],
          ),
        ),
        /*
        ==== List of Foods and Images ====
        */
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                padding: EdgeInsets.only(bottom: Dimensions.height10),
                // color: Colors.black26,
                child: Row(children: [
                  /*
                  ==== Image Section ====
                  */
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/food-1.jpeg"))),
                  ),

                  /*
                  ==== Text Section ====
                  */
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight:
                                  Radius.circular(Dimensions.radius20)),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: 'Nutritious Fruit Meal in China'),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            SmallText(text: 'With Chinese Characteristics'),
                            SizedBox(
                              height: Dimensions.height10,
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
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              );
            })),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      // Try to looking next slide
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                // color: index.isEven ? Color(0xFF69c5df) : Color(0xFFB642E4),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food-4.jpeg"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width25,
                  right: Dimensions.width25,
                  bottom: Dimensions.width40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.height20,
                    right: Dimensions.height20),
                child: AppColumn(
                  text: "Grilled Shrimp",
                  fontSize: Dimensions.fontSize20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
