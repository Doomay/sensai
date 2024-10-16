// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height
  double returnValue = (inputHeight / 812.0) * screenHeight;
/*   Logger().d("SizeConfig - getProportionateScreenHeight ",
      "input: ${inputHeight} | screenHeight :${screenHeight} | returnValue: ${returnValue}");
 */
  return returnValue;
}

// Get the proportionate height as per screen size
double getProportionateScreenHeightByPercent(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height
  double returnValue = inputHeight * screenHeight; //(inputHeight / 812.0)
/*   Logger().d("SizeConfig - getProportionateScreenHeight ",
      "input: ${inputHeight} | screenHeight :${screenHeight} | returnValue: ${returnValue}");
 */
  return returnValue;
}

// Get the proportionate width as per screen size
double getProportionateScreenWidthByPercent(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width
  double returnValue = inputWidth * screenWidth!; //(inputHeight / 375.0)
/*   Logger().d("SizeConfig - getProportionateScreenHeight ",
      "input: ${inputWidth} | screenHeight :${screenWidth} | returnValue: ${returnValue}");
 */
  return returnValue;
}

// Get the proportionate width as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth!;
  // 375 is the layout width
  return (inputWidth / 375.0) * screenWidth;
}
