// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/Home/controller/homeController.dart';

// Project imports:
import '../../layout/bottom_nav/bottom_nav.dart';
import '../../util/size_config.dart';
import './widgets/body.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    Get.lazyPut(
      () => HomeController(),
    );
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: const Body(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
