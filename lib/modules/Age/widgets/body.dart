import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/SignUp/controller/signUpController.dart';
import 'package:sensai/routes/routes.dart';

class AgePage extends StatelessWidget {
  static String routeName = "/age";
  const AgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find<SignUpController>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "How old are you?",
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
              ),
              Obx(() => Column(
                children: [
                  Text('Age: ${controller.age.value}'),
                  Slider(
                    value: controller.age.value.toDouble(),
                    min: 12,
                    max: 80,
                    divisions: 68,
                    label: controller.age.value.toString(),
                    onChanged: (double value) {
                      controller.age.value = value.toInt();
                    },
                  ),
                ],
              )),
              navigationButtons(
                onNextPressed: () => Get.toNamed(Routes.WEIGHT),
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationButtons({required Function onNextPressed, required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.filled(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
        ElevatedButton(
          onPressed: () => onNextPressed(),
          child: Text("Next"),
        ),
      ],
    );
  }
}
