// ignore_for_file: prefer_const_constructors,
// avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/detailsController.dart';
import 'package:sensai/routes/routes.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class WeightBody extends GetView<DetailsController> {
  const WeightBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "What's your weight?",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'kanit'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          "You can always change this later",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'kanit'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${controller.weight.toStringAsFixed(1)} kg",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  VerticalWeightSlider(
                    controller: controller.weightController,
                    decoration: const PointerDecoration(
                      width: 130,
                      height: 3,
                      largeColor: Colors.limeAccent,
                      mediumColor: Colors.limeAccent,
                      smallColor: Colors.limeAccent,
                      gap: 30,
                    ),
                    onChanged: (double value) {
                      controller.weight.value = value;
                    },
                    indicator: Container(
                      height: 3,
                      width: 200,
                      alignment: Alignment.centerLeft,
                      color: Colors.red[300],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey),
                      child: IconButton.filled(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.HEIGHT);
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 60,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.limeAccent,
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 35),
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Kanit-Regular',
                                        color: Colors.black,
                                      ),
                                    )),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  size: 40,
                                  color: Colors.black,
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
