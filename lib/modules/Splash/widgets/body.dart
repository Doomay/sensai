import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/Splash/controller/splashController.dart';
import 'package:sensai/routes/routes.dart';

// Package imports:

import '../../../util/size_config.dart';
import './splash_content.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<splashscreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/splashImage1.png",
      "text": "Meet your coach,",
      "subText": "start your journey"
    },
    {
      "image": "assets/images/splashImage2.png",
      "text": "Create your boxing",
      "subText": "plan to stay fit"
    },
    {
      "image": "assets/images/splashImage3.png",
      "text": "Action is the",
      "subText": "key to all success"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView( // Make the content scrollable
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // Expanded container for the PageView
              SizedBox(
                height: getProportionateScreenHeightByPercent(0.8),
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]["text"],
                    subText: splashData[index]["subText"],
                  ),
                ),
              ),
              
              // Dots indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    splashData.length, (index) => buildDot(index: index)),
              ),
              
              // Start Button with appropriate padding
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.SIGNUP); // Navigate to SignUp
                    },
                    child: Container(
                        height: getProportionateScreenHeightByPercent(0.06),
                        width: getProportionateScreenWidthByPercent(0.4),
                        decoration: BoxDecoration(
                            color: Colors.limeAccent,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Start now",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Kanit-Regular',
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_right_rounded,
                              color: Colors.black,
                              size: 30,
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dot indicator function
  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(right: 5),
      height: 3,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
