// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/PhysicalActivity/widgetphysical/physical.dart';
import 'package:sensai/modules/detailsController.dart';

// Project imports:
import '../../util/size_config.dart';


class PhysicalActivityPage extends StatelessWidget {
  static String routeName = "/physicalActivity";

  const PhysicalActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    Get.lazyPut(() => DetailsController());
    return const Scaffold(
      backgroundColor: Colors.black,
      body: PhysicalActivityPage(),
    );
  }
}

