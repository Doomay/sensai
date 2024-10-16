import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sensai/routes/routes.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  @override
  void onReady() async {
    super.onReady();
    if (await getStorage.read("email") != null &&
        await getStorage.read("password") != null) {
      Get.toNamed(Routes.HOME);
    } else if (await getStorage.read("FirstLogin") != null) {
      Get.offAllNamed(Routes.SIGNUP);
    } else {
      await getStorage.write("FirstLogin", "1");
    }
  }
}
