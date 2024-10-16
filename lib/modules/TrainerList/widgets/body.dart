import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/routes/routes.dart';
import 'package:sensai/util/custom_trainer_list_card.dart';

import '../../Schedule/controller/scheduleController.dart';

class Body extends GetView<ScheduleController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.trainerList.isEmpty) {
      controller.getTrainers(context);
    }
    return Obx(() {
      if (controller.trainerListLoading.value == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      // ignore: invalid_use_of_protected_member
      if (controller.trainerList.value.isEmpty) {
        return const Center(
          child: Text("No Trainers available"),
        );
      }
      return SafeArea(
        child: Column(
          children: controller.trainerList.map((element) {
            return CustomTrainerListCard(
              rating: element.overallRating.toString(),
              image: element.imagePath != null
                  ? "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/${element.imagePath!}"
                  : "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/no-image.png",
              name: element.name,
              onPress: () {
                controller.trainerId = element.trainerId!;
                controller.selectedTrainer = element;
                Get.toNamed(Routes.TRAINERDETAILS);
              },
              experience: element.experience,
              trainingType: "High Intensity Training",
            );
          }).toList(),
        ),
      );
    });
  }
}
