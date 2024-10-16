import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/SignUp/controller/signUpController.dart';

class goalBody extends StatelessWidget {
  const goalBody({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find<SignUpController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Heading
        const Column(
          children: [
            Text(
              "What's your goal?",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "This helps us create your personalized plan",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),

        // Goal Picker
        Obx(() {
          return DropdownButton<int>(
            value: controller.goal.value,
            items: [
              DropdownMenuItem(
                value: 0,
                child: Text("Gain Weight", style: TextStyle(color: Colors.white)),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text("Lose Weight", style: TextStyle(color: Colors.white)),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text("Get Fitter", style: TextStyle(color: Colors.white)),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text("Relaxation", style: TextStyle(color: Colors.white)),
              ),
              DropdownMenuItem(
                value: 4,
                child: Text("Learn the Basics", style: TextStyle(color: Colors.white)),
              ),
            ],
            onChanged: (value) {
              controller.goal.value = value!;
            },
            dropdownColor: Colors.black,
            underline: const SizedBox(),
            style: const TextStyle(fontSize: 20, color: Colors.white),
          );
        }),

        // Next Button
        ElevatedButton(
          onPressed: () {
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
          },
          child: const Text("Next"),
        ),
      ],
    );
  }
}
