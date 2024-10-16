// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/SignUp/controller/signUpController.dart';

// Project imports:
import '../../layout/bottom_nav/bottom_nav.dart';
import '../../util/size_config.dart';
import './widgets/body.dart';
import 'controller/profileController.dart';

class ProfilePage extends GetView<SignUpController>  {
  static String routeName = "/profile";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    Get.put(() => SignUpController(), permanent: true);
    Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
