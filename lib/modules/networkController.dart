import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const Text(
          "Please connect to the internet",
          style: TextStyle(color: Colors.white),
        ),
        snackStyle: SnackStyle.FLOATING,
        borderRadius: 10,
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Colors.red,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
