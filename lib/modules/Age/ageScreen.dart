// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/Age/widgets/body.dart';
import 'package:sensai/modules/detailsController.dart';

// Project imports:
import '../../util/size_config.dart';
import './widgets/body.dart';

class AgePage extends StatelessWidget {
  static String routeName = "/age";

  const AgePage({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    Get.lazyPut(() => DetailsController());
    return const Scaffold(
      backgroundColor: Colors.black,
      body: AgePage(),
    );
  }
}
