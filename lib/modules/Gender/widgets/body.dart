import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/detailsController.dart';
import 'package:sensai/routes/routes.dart';
import 'package:sensai/util/size_config.dart';

class Gender extends GetView<DetailsController> {
  const Gender({Key? key}) : super(key: key);

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
                children: [
                  SizedBox(
                    height: getProportionateScreenHeightByPercent(0.05),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Tell us about yourself!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'kanit',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: getProportionateScreenWidthByPercent(0.6),
                        child: Text(
                          "To give you a better experience, we need to know your gender.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'kanit',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Gender selection buttons
              TextButton(
                onPressed: () {
                  controller.gender.value = 0;
                },
                child: Container(
                  height: getProportionateScreenHeightByPercent(0.15),
                  width: getProportionateScreenHeightByPercent(0.15),
                  decoration: BoxDecoration(
                    color: controller.gender.value == 0
                        ? Colors.limeAccent
                        : Colors.black,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Icon(
                    Icons.male,
                    color: controller.gender.value == 0
                        ? Colors.black
                        : Colors.white,
                    size: getProportionateScreenHeightByPercent(0.1),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.gender.value = 1;
                },
                child: Container(
                  height: getProportionateScreenHeightByPercent(0.15),
                  width: getProportionateScreenHeightByPercent(0.15),
                  decoration: BoxDecoration(
                    color: controller.gender.value == 1
                        ? Colors.limeAccent
                        : Colors.black,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Icon(
                    Icons.female,
                    color: controller.gender.value == 1
                        ? Colors.black
                        : Colors.white,
                    size: getProportionateScreenHeightByPercent(0.1),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.gender.value = 2;
                },
                child: Container(
                  height: getProportionateScreenHeightByPercent(0.15),
                  width: getProportionateScreenHeightByPercent(0.15),
                  decoration: BoxDecoration(
                    color: controller.gender.value == 2
                        ? Colors.limeAccent
                        : Colors.black,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Icon(
                    Icons.transgender,
                    color: controller.gender.value == 2
                        ? Colors.black
                        : Colors.white,
                    size: getProportionateScreenHeightByPercent(0.1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey,
                      ),
                      child: IconButton.filled(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (controller.gender.value != -1) {
                          // Navigate to the next page if gender is selected
                          Get.toNamed(Routes.AGE);
                        } else {
                          Get.snackbar('Error', 'Please select a gender',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white);
                        }
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 60,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.limeAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 35),
                                child: const Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Kanit-Regular',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_right_rounded,
                                size: 40,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
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
