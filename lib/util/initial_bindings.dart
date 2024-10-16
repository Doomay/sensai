// Package imports:
import 'package:get/get.dart';
import 'package:sensai/modules/Home/controller/homeController.dart';
import 'package:sensai/modules/Splash/controller/splashController.dart';
import '../layout/bottom_nav/bottom_nav_controller.dart';

// Project imports:
import '../modules/Profile/controller/profileController.dart';
import '../modules/Schedule/controller/scheduleController.dart';
import '../modules/SignUp/controller/signUpController.dart';
import '../modules/SignUp/controller/logInController.dart';
import '../modules/navigationController.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(NavigationController(), permanent: true);
    Get.put<BottomNavController>(BottomNavController(), permanent: true);
    Get.put<SignUpController>(SignUpController(), permanent: true);
    Get.put<SignInController>(SignInController(), permanent: true);
    Get.put<ProfileController>(ProfileController(), permanent: true);
    Get.put<ScheduleController>(ScheduleController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<SplashController>(SplashController(), permanent: true);
  }
}
