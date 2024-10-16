// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sensai/routes/routes.dart';

// Project imports:
import '../../data/model/entry.dart';

class BottomNavController extends GetxController {
  List<Entry> entryList = [];

  @override
  void onInit() {
    super.onInit();
    entryList = [
      Entry(
          icon: Icons.home,
          title: "Home",
          isActive: false,
          navigateTo: Routes.HOME),
      Entry(
          icon: Icons.calendar_month,
          title: "Schedule",
          isActive: true,
          navigateTo: Routes.SCHEDULE),
      Entry(
        icon: Icons.equalizer_rounded,
        title: "Analytics",
        isActive: false,
        navigateTo: Routes.ANALYTICS,
      ),
      Entry(
          icon: Icons.account_circle,
          title: "Profile",
          isActive: false,
          navigateTo: Routes.PROFILE),
    ];
  }
}
