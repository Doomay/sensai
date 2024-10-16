// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Project imports:
import '../../../util/size_config.dart';
import '../controller/splashController.dart';

class SplashContent extends GetView<SplashController> {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
    this.subText,
  }) : super(key: key);
  final String? text, image, subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          image!,
          height: getProportionateScreenHeightByPercent(0.71),
          width: getProportionateScreenWidthByPercent(1.0),
          fit: BoxFit.none,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text!,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontFamily: 'kanit',
              ),
            ),
            Text(
              subText!,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontFamily: 'kanit',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
