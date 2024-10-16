import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/SignUp/controller/logInController.dart';

class LoginTab extends GetView<SignInController> {
  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: controller.signInFormKey, // Use a separate form key for login
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Email TextFormField
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.loginEmail,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                // Password TextFormField
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.loginPassword,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Login Button
                Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator() // Loader during login
                    : ElevatedButton(
                        onPressed: () {
                          if (controller.signInFormKey.currentState!.validate()) {
                            // Call login method without context, just pass required parameters
                            controller.signIn(
                              controller.loginEmail.text,
                              controller.loginPassword.text,
                            );
                          }
                        },
                        child: const Text('Login'),
                      )),
                // Switch to Sign Up
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigate to sign up tab or perform another action
                    // Example: Get.to(() => SignUpTab());
                  },
                  child: const Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
