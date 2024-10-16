import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/routes/routes.dart';
import 'package:sensai/util/custom_profile_button.dart';
import 'package:sensai/util/custom_profile_details_card.dart';
import '../controller/profileController.dart';
import '../../../util/size_config.dart';

class Body extends GetView<ProfileController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeightByPercent(0.05),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Profile",
                style: TextStyle(
                  fontFamily: 'kanit',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: getProportionateScreenHeightByPercent(0.18),
                  width: getProportionateScreenHeightByPercent(0.18),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/no-image.png",
                    ),
                  ),
                ),
                Container(
                  height: getProportionateScreenHeightByPercent(0.2),
                  width: 0.5,
                  color: const Color(0xFF2C2C2E),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Joined",
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "${controller.diferenceTime()} days ago",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'kanit'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Mood: ${controller.getMood()}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'kanit',
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Text(
                  controller.signUpUser.value?.name ?? "",
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'kanit',
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomProfileDetailsCard(
                  firstLine: "${controller.signUpUser.value?.height} cm",
                  secondLine: "Height",
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomProfileDetailsCard(
                  firstLine: "${controller.signUpUser.value?.weight} kg",
                  secondLine: "Weight",
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomProfileDetailsCard(
                  firstLine: "${controller.signUpUser.value?.age} yo",
                  secondLine: "Age",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 0.2,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            CustomProfileButton(
              title: "Edit Profile",
              showIcon: true,
              textColor: Colors.white,
              onPress: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 0.2,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            // CustomProfileButton(
            //   title: "Privacy policy",
            //   showIcon: true,
            //   textColor: Colors.white,
            //   onPress: () {},
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, right: 10),
            //   child: Container(
            //     height: 0.2,
            //     width: double.infinity,
            //     color: Colors.white,
            //   ),
            // ),
            CustomProfileButton(
              title: "Settings",
              showIcon: true,
              textColor: Colors.white,
              onPress: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 0.2,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            CustomProfileButton(
              title: "Sign Out",
              showIcon: false,
              textColor: Colors.red,
              onPress: () {
                if (Platform.isIOS) {
                  showCupertinoDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: const Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: const Text("Logout"),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Cancel"),
                        ),
                      ],
                    ),
                  );
                } else {
                  return showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: const Text("Logout"),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Cancel"),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 0.2,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
