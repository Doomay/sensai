import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/analyticsController.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends GetView<AnalyticsController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: GestureDetector(
          child: Image.asset('assets/images/coming_soon_icon.png'),
          onTap: () async {
            final url = Uri.parse('https://www.sensai.app/');
            if (!await launchUrl(
              url,
              mode: LaunchMode.externalApplication,
            )) {
              throw Exception('Could not launch $url');
            }
          },
        ),
      ),
    );
  }
}
