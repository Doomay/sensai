import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/signUpController.dart';

class SignUpTab extends GetView<SignUpController> {
  const SignUpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: controller.signUpFormKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Name TextFormField
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                // Email TextFormField
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.emailController,
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
                    controller: controller.passwordController,
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
                // Re-enter Password TextFormField
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.rePasswordController,
                    decoration: const InputDecoration(labelText: 'Re-enter Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value != controller.passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                // Gender Dropdown
                Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: controller.gender.value == 0
                        ? "Male"
                        : controller.gender.value == 1
                            ? "Female"
                            : "Other",
                    onChanged: (String? newValue) {
                      if (newValue == "Male") {
                        controller.gender.value = 0;
                      } else if (newValue == "Female") {
                        controller.gender.value = 1;
                      } else {
                        controller.gender.value = 2;
                      }
                    },
                    decoration: const InputDecoration(labelText: 'Gender'),
                    items: <String>['Male', 'Female', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your gender';
                      }
                      return null;
                    },
                  ),
                )),
                // Age Slider
                Obx(() => Column(
                  children: [
                    Text('Age: ${controller.age.value}'),
                    Slider(
                      value: controller.age.value.toDouble(),
                      min: 18,
                      max: 80,
                      divisions: 62,
                      label: controller.age.value.toString(),
                      onChanged: (double value) {
                        controller.age.value = value.toInt();
                      },
                    ),
                    // Weight Slider
                    Text('Weight: ${controller.weight.value} kg'),
                    Slider(
                      value: controller.weight.value,
                      min: 30,
                      max: 150,
                      divisions: 120,
                      label: controller.weight.value.toString(),
                      onChanged: (double value) {
                        controller.weight.value = value;
                      },
                    ),
                    // Height Slider
                    Text('Height: ${controller.height.value} cm'),
                    Slider(
                      value: controller.height.value.toDouble(),
                      min: 140,
                      max: 220,
                      divisions: 80,
                      label: controller.height.value.toString(),
                      onChanged: (double value) {
                        controller.height.value = value.toInt();
                      },
                    ),
                  ],
                )),
                const SizedBox(height: 20),
                // Sign Up Button
                Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator() // Loader during sign-up
                    : ElevatedButton(
                        onPressed: () {
                          if (controller.signUpFormKey.currentState!.validate()) {
                            // Call signUp method without context, just pass required parameters
                            controller.signUp(
                              controller.nameController.text,
                              controller.emailController.text,
                              controller.passwordController.text,
                              controller.gender.value == 0
                                  ? "Male"
                                  : controller.gender.value == 1
                                      ? "Female"
                                      : "Other",
                              controller.weight.value,
                              controller.height.value,
                              controller.age.value,
                              controller.goal.value,
                              controller.physicalActivity.value,
                            );
                          }
                        },
                        child: const Text('Sign Up'),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
