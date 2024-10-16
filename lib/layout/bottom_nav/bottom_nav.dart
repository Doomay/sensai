// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sensai/layout/bottom_nav/bottom_nav_controller.dart';
import '../../modules/navigationController.dart';
import '../../util/constants.dart';
import './bottom_nav_item.dart';

class BottomNavBar extends GetView<BottomNavController> {
  final NavigationController navController = NavigationController.to;

  BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BottomNavController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      color: kPrimaryColor.withOpacity(0.1),
      child: Wrap(children: [
        Container(
          margin: GetPlatform.isIOS ? const EdgeInsets.only(bottom: 20) : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ...controller.entryList.map((element) {
                return BottomNavItem(
                  title: element.title,
                  icon: element.icon,
                  isActive: (navController.selectedNav == element.navigateTo),
                  press: () {
                    if (navController.selectedNav != element.navigateTo) {
                      navController.selectedNav = element.navigateTo;
                      Get.offAllNamed(element.navigateTo);
                    }
                  },
                );
              }).toList()
            ],
          ),
        ),
      ]),
    );
  }
}
