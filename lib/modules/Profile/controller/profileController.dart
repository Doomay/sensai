import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sensai/data/model/signUp.dart';
import 'package:sensai/modules/Home/controller/homeController.dart';
import 'package:sensai/modules/SignUp/controller/logInController.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  Rx<SignUp?> signUpUser = Rx<SignUp?>(null);


  int diferenceTime() {
    var currentTime = DateTime.now();
    print("The signup user is $signUpUser");
    // var joinedTime = DateTime.parse(signUpUser.value!.created_on);
    var currentTimes = DateTime.now();
    return currentTime.difference(currentTimes).inDays;
  }

  String getMood() {
    if (Get.find<HomeController>().mood.value == 0) {
      return "Happy";
    } else if (Get.find<HomeController>().mood.value == 1) {
      return "Calm";
    } else if (Get.find<HomeController>().mood.value == 2) {
      return "Manic";
    } else if (Get.find<HomeController>().mood.value == 3) {
      return "Angry";
    } else if (Get.find<HomeController>().mood.value == 4) {
      return "Sad";
    } else {
      return "Happy";
    }
  }
}
