// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/Weight/widgets/body.dart';
import 'package:sensai/modules/detailsController.dart';

// Project imports:
import '../../util/size_config.dart';

class WeightPage extends StatelessWidget {
  static String routeName = "/weight";

  const WeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig for responsive design
    SizeConfig().init(context);
    
    // GetX: Lazily put the DetailsController if not already initialized
    Get.lazyPut(() => DetailsController());

    return const Scaffold(
      backgroundColor: Colors.black,
      body: WeightBody(),  // This calls the front-end defined in body.dart
    );
  }
}
