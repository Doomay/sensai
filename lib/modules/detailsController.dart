import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class DetailsController extends GetxController {
  static DetailsController get to => Get.find();

  // Observable variables for gender, weight, height, age, goal, and activity level
  RxInt gender = 0.obs; // Default to Male
  final weight = 70.0.obs; // Default weight
  late WeightSliderController weightController;
  final age = 25.obs; // Default age
  final height = 170.obs; // Default height
  final goal = 1.obs; // Default goal
  final physicalActivity = 1.obs; // Default activity level

  @override
  void onInit() {
    super.onInit();
    weightController = WeightSliderController(
      initialWeight: weight.value, 
      minWeight: 30, 
      interval: 0.1
    );
  }
}
