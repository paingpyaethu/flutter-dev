import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  //Dynamic Height Padding and Margin
  static double height5 = screenHeight / 168.8;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.3;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.8;
  static double height50 = screenHeight / 16.9;

  //Dynamic Width Padding and Margin
  static double width10 = screenHeight / 84.4;
  static double width20 = screenHeight / 42.2;
  static double width25 = screenHeight / 33.8;
  static double width30 = screenHeight / 28.13;
  static double width40 = screenHeight / 21.1;
  static double width45 = screenHeight / 18.8;

  static double fontSize12 = screenHeight / 70.3;
  static double fontSize14 = screenHeight / 60.28;
  static double fontSize16 = screenHeight / 52.75;
  static double fontSize20 = screenHeight / 42.2;
  static double fontSize26 = screenHeight / 32.46;

  static double radius15 = screenHeight / 56.3;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  static double iconSize15 = screenHeight / 56.3;
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize24 = screenHeight / 35.2;

  //List View Size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  //Popular Food Details
  static double popularFoodImgSize = screenHeight / 2.41;

  //Bottom Height
  static double bottomHeightBar = screenHeight / 7.03;
}
