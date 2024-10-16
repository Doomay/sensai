import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/routes/routes.dart';
import '../controller/homeController.dart';
import '../../../util/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends GetView<HomeController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "How are you feeling today?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontFamily: 'kanit',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.mood.value = 0;
                      },
                      child: Container(
                        height: getProportionateScreenHeightByPercent(0.08),
                        width: getProportionateScreenWidthByPercent(0.16),
                        decoration: BoxDecoration(
                          color: Colors.limeAccent,
                          borderRadius: BorderRadius.circular(10),
                          border: controller.mood.value == 0
                              ? Border.all(width: 5, color: Colors.lightBlue)
                              : Border.all(width: 0),
                        ),
                        child: Image.asset('assets/images/Happy.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Happy",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.mood.value = 1;
                      },
                      child: Container(
                          height: getProportionateScreenHeightByPercent(0.08),
                          width: getProportionateScreenWidthByPercent(0.16),
                          decoration: BoxDecoration(
                            color: Colors.limeAccent,
                            borderRadius: BorderRadius.circular(10),
                            border: controller.mood.value == 1
                                ? Border.all(width: 5, color: Colors.lightBlue)
                                : Border.all(width: 0),
                          ),
                          child: Image.asset('assets/images/Calm.png')),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Calm",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.mood.value = 2;
                      },
                      child: Container(
                          height: getProportionateScreenHeightByPercent(0.08),
                          width: getProportionateScreenWidthByPercent(0.16),
                          decoration: BoxDecoration(
                            color: Colors.limeAccent,
                            borderRadius: BorderRadius.circular(10),
                            border: controller.mood.value == 2
                                ? Border.all(width: 5, color: Colors.lightBlue)
                                : Border.all(width: 0),
                          ),
                          child: Image.asset('assets/images/Relax.png')),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Manic",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.mood.value = 3;
                      },
                      child: Container(
                        height: getProportionateScreenHeightByPercent(0.08),
                        width: getProportionateScreenWidthByPercent(0.16),
                        decoration: BoxDecoration(
                          color: Colors.limeAccent,
                          borderRadius: BorderRadius.circular(10),
                          border: controller.mood.value == 3
                              ? Border.all(width: 5, color: Colors.lightBlue)
                              : Border.all(width: 0),
                        ),
                        child: Image.asset('assets/images/angry.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Angry",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.mood.value = 4;
                      },
                      child: Container(
                        height: getProportionateScreenHeightByPercent(0.08),
                        width: getProportionateScreenWidthByPercent(0.16),
                        decoration: BoxDecoration(
                          color: Colors.limeAccent,
                          borderRadius: BorderRadius.circular(10),
                          border: controller.mood.value == 4
                              ? Border.all(width: 5, color: Colors.lightBlue)
                              : Border.all(width: 0),
                        ),
                        child: const Icon(
                          Icons.mood_bad_rounded,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Sad",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeightByPercent(0.03),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.SCHEDULE);
            },
            child: Container(
              height: getProportionateScreenHeightByPercent(0.18),
              width: getProportionateScreenWidthByPercent(0.95),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(
                  "assets/images/bookAppointmentImage.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Workout Categories",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'kanit',
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.limeAccent,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Image.asset('assets/images/coming_soon_icon.png'),
            onTap: () async {
              final url = Uri.parse('https://www.sensai.app/');
              if (!await launchUrl(
                url,
                mode: LaunchMode.externalApplication,
              )) {
                throw Exception('Could not launch $url');
              }
            },
          )
        ],
      ),
    );
  }
}
