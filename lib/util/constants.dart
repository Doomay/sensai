// Flutter imports:
import 'package:flutter/material.dart';

import '../util/size_config.dart';

const appVersion = '0.0.1';
const kRupee = '₹';
const kPrimaryColor = Colors.limeAccent;
const kPrimaryLightColor = Colors.limeAccent;
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.limeAccent, Colors.limeAccent],
);
const kSecondaryColor = Color(0xFFff9900);
const kTextColor = Color(0xFF757575);
const kBestSellerColor = Color(0xFFFFD073);
const kAnimationDuration = Duration(milliseconds: 200);
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}

double dFixed(double value) {
  return double.parse((value).toStringAsFixed(2));
}

double getDouble(String? value) {
  double result = 0.0;
  if (value != null && value != "") {
    result = double.parse(value);
  }
  return result;
}
