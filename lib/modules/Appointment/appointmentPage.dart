// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/Schedule/controller/scheduleController.dart';

// Project imports:
import '../../util/size_config.dart';
import './widgets/body.dart';

class AppointmentPage extends StatelessWidget {
  static String routeName = "/appointment";

  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    Get.lazyPut(() => ScheduleController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Appointment",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'kanit',
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.keyboard_arrow_left_rounded),
          color: Colors.white,
          iconSize: 30,
        ),
      ),
      backgroundColor: Colors.black,
      body: const Body(),
    );
  }
}
