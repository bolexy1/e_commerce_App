import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class Dimentions {
// static double screenHeight = Get.context!.height;
// static double screenWidth = Get.context!.width;

// static double pageView = screenHeight/2.64;
// static double pageViewContainer = screenHeight/3.84;
// static double pageViewTextContainer = screenHeight/7.03;
// static double height10 = screenHeight /84.4;
// static double height20 = screenHeight /42.2;
// static double height15 = screenHeight /56.27;
// }
 

//  class AppLayout {
//   static getSize(BuildContext context){
//     return MediaQuery.of(context).size;
//   }

//   static getScreenHeight(){
//     return Get.height;
//   }

//    static getScreenWidth(){
//     return Get.width;
//   }

//   static getHeight(double pixels){
//     double x = getScreenHeight()/pixels;
//     return getScreenHeight()/x;
//   }

//   static getWidth(double pixels){
//     double x = getScreenWidth()/pixels;
//     return getScreenWidth()/x;
//   }
// }




class AppLayout {
  static double screenHeight = Get.context?.height ?? 812.0; // fallback to iPhone X height
  static double screenWidth = Get.context?.width ?? 375.0;   // fallback to iPhone X width

  static double baseHeight = 812.0;
  static double baseWidth = 375.0;

  /// Scale height based on design height
  static double getHeight(double inputHeight) {
    double value = (inputHeight / baseHeight) * screenHeight;
    return value < 0 ? 0 : value; // Prevent negative padding
  }

  /// Scale width based on design width
  static double getWidth(double inputWidth) {
    double value = (inputWidth / baseWidth) * screenWidth;
    return value < 0 ? 0 : value;
  }

  /// Optional: Call this early to initialize screen size
  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
}
