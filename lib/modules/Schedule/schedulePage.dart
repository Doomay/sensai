// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/layout/bottom_nav/bottom_nav.dart';
import 'package:sensai/modules/Schedule/controller/scheduleController.dart';

// Project imports:
import '../../util/size_config.dart';
import './widgets/body.dart';

class SchedulePage extends StatelessWidget {
  static String routeName = "/schedule";

  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    Get.lazyPut(() => ScheduleController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: const Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
