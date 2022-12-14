import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_foods/screens/food/slider_food_detail.dart';
import 'package:just_foods/screens/home/main_food_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MainFoodPage(),
      home: SliderFoodDetail(),
    );
  }
}
