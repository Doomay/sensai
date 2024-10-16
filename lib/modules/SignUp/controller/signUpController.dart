import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
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

  // Observable variables for user attributes
  var gender = (-1).obs;
  var age = 18.obs;
  var weight = 50.0.obs;
  var height = 160.obs;
  var goal = 0.obs;
  var physicalActivity = 0.obs;

  // Keys for form validation
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    nameController = TextEditingController();
    loginEmail = TextEditingController();
    loginPassword = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    nameController.dispose();
    loginEmail.dispose();
    loginPassword.dispose();
    super.onClose();
  }

  // Sign Up Method
  Future<void> signUp(
    String name,
    String email,
    String password,
    String gender,
    double weight,
    int height,
    int age,
    int goal,
    int physicalActivity,
  ) async {
    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/register'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "gender": gender,
          "weight": weight,
          "height": height,
          "age": age,
          "goal": goal,
          "physicalActivity": physicalActivity,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var userData = jsonDecode(response.body);  
        if (userData['success'] == true) {
          appUser.value = userData['user']; 
          isLoading.value = false; 
          Get.toNamed('/home'); // Navigate to home after successful signup
        } else {
          isLoading.value = false;
          Get.snackbar('Error', userData['message']);
        }
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Failed to sign up');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Error occurred: $e');
    }
  }
}
