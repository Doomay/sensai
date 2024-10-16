import 'package:custom_cupertino_picker/custom_cupertino_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/SignUp/controller/signUpController.dart';
import 'package:sensai/routes/routes.dart';
import '../../../util/size_config.dart';

class HeightPage extends StatelessWidget {
  static String routeName = "/height";

  const HeightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.find<SignUpController>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "What's your height? (cms)",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'kanit'
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          "This helps us create your personalized plan",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'kanit'
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeightByPercent(0.4),
                child: CustomCupertinoPicker(
                  highlighterBorder: const Border(
                    top: BorderSide(width: 4.0, color: Colors.limeAccent),
                    bottom: BorderSide(width: 4.0, color: Colors.limeAccent),
                  ),
                  itemExtent: 80,
                  onSelectedItemChanged: (value) {
                    signUpController.height.value = value + 140;  // Adjust height range
                  },
                  highlighterBorderWidth: 100,
                  scrollPhysics: const FixedExtentScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  children: List.generate(80, (index) {
                    int number = index + 140;  // Heights between 140cm and 220cm
                    return Text(
                      number.toString(),
                      style: const TextStyle(fontSize: 60.0, color: Colors.white),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.GOAL);
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
                              const Icon(Icons.arrow_right_rounded, size: 40, color: Colors.black),
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
