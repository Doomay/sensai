import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  // Observable variables for loading state and user data
  var isLoading = false.obs;
  var appUser = Rxn<Map<String, dynamic>>();

  // TextEditingController declarations
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  late TextEditingController nameController;

  // For login specifically
  late TextEditingController loginEmail;
  late TextEditingController loginPassword;

  // Keys for form validation
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // Initialize TextEditingControllers for both signup and login
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    nameController = TextEditingController();

    loginEmail = TextEditingController();
    loginPassword = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    // Dispose TextEditingControllers to prevent memory leaks
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    nameController.dispose();
    loginEmail.dispose();
    loginPassword.dispose();
    super.onClose();
  }

  // Sign In Method with named parameters
  Future<void> signIn(
    String email,
    String password,
    // BuildContext context,
  ) async {
    isLoading.value = true;

try {
  final response = await http.post(
    Uri.parse('http://localhost:3000/login'),
    headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode({
      "email": email,
      "password": password,
     }),
  );
  
  if (response.statusCode == 200) {
    var userData = jsonDecode(response.body);
    if (userData['success'] == true) {
      appUser.value = userData['user'];
      isLoading.value = false;
      Get.toNamed('/home');
    } else {
      isLoading.value = false;
      Get.snackbar('Error', userData['message']);
    }
  } else if (response.statusCode == 404) {
    // User not found
    isLoading.value = false;
    Get.snackbar('Error', 'User not found.');
  } else if (response.statusCode == 401) {
    // Incorrect password
    isLoading.value = false;
    Get.snackbar('Error', 'Incorrect password. Please try again.');
  } else {
    // General error handling for other status codes
    isLoading.value = false;
    Get.snackbar('Error', 'Login failed with status code: ${response.statusCode}. Please try again later.');
  }
  } catch (e) {
    isLoading.value = false;
    Get.snackbar('Error', 'An unexpected error occurred: $e');
  }
  }
}
