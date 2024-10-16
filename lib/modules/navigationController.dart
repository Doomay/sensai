// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../routes/routes.dart';

class NavigationController extends GetxController {
  static NavigationController to = Get.find();
  final selectedNavHome = Routes.HOME.obs;
  set selectedNav(value) => selectedNavHome.value = value;
  get selectedNav => selectedNavHome.value;
}
