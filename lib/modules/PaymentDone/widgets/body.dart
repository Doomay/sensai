import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../Schedule/controller/scheduleController.dart';
import '../../../util/size_config.dart';

class Body extends GetView<ScheduleController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 36,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Payment Completed!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'kanit',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: getProportionateScreenWidthByPercent(0.8),
                  child: const Text(
                    "You've book a new appointment with your trainer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'kanit',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: Platform.isIOS
                    ? getProportionateScreenHeight(0.35)
                    : getProportionateScreenHeightByPercent(0.34),
                width: double.infinity - 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF222831)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Trainer",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: Colors.grey),
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  controller.selectedTrainer
                                                              .imagePath ==
                                                          null
                                                      ? "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/no-image.png"
                                                      : "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/${controller
                                                              .selectedTrainer
                                                              .imagePath!}",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeightByPercent(
                                                        0.03),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        getProportionateScreenHeightByPercent(
                                                            0.02),
                                                  ),
                                                  Text(
                                                    controller
                                                        .selectedTrainer.name
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontFamily: 'kanit',
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color:
                                                            Colors.limeAccent),
                                                    child: Text(
                                                      controller.selectedTrainer
                                                          .overallRating
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                controller.selectedTrainer.type
                                                            .toString() !=
                                                        "-"
                                                    ? controller
                                                        .selectedTrainer.type
                                                        .toString()
                                                    : "High Intensity Training",
                                                style: const TextStyle(
                                                    color: Colors.limeAccent),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: double.infinity,
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeightByPercent(0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Date",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'kanit',
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${controller.appointmentFormatter.format(controller.appointmentCurrentDate2.value)} - ${controller.dayName.format(controller.appointmentCurrentDate2.value)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'kanit',
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Time",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'kanit',
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.selectedTime.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'kanit',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeightByPercent(0.04),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: getProportionateScreenWidthByPercent(0.6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.limeAccent,
                ),
                child: TextButton(
                  onPressed: () {
                    controller.selectedTime.value = "";
                    controller.appointmentCurrentDate2.value = DateTime.now();
                    Get.toNamed(Routes.SCHEDULE);
                  },
                  child: const Text(
                    "Done",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
