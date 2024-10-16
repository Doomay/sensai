// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/Profile/controller/profileController.dart';
import 'package:sensai/modules/SignUp/controller/signUpController.dart';

// Project imports:
import '../../util/size_config.dart';
import './widgets/body.dart';

class SignUpPage extends StatelessWidget {
  static String routeName = "/signUp";

  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => ProfileController());
    return const Scaffold(
      backgroundColor: Colors.black,
      body: LogInTab(),
    );
  }
}
