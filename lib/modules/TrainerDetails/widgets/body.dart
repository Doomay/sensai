import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/modules/Schedule/controller/scheduleController.dart';
import 'package:sensai/routes/routes.dart';
import 'package:sensai/util/custom_review_card.dart';
import '../../../util/size_config.dart';

class Body extends GetView<ScheduleController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.selectedTrainer.name == null) {
      controller.getTrainerById(context);
    }

    return Obx(() {
      if (controller.trainerLoading == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: getProportionateScreenHeightByPercent(1.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      controller.selectedTrainer.imagePath != null
                          ? "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/${controller.selectedTrainer.imagePath!}"
                          : "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/no-image.png",
                      height: getProportionateScreenHeightByPercent(0.3),
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_left_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              controller.selectedTrainer.name.toString(),
                              style: const TextStyle(
                                fontFamily: 'kanit',
                                fontSize: 26,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              controller.selectedTrainer.type.toString() != "-"
                                  ? controller.selectedTrainer.type.toString()
                                  : "High Intensity Training",
                              style: const TextStyle(
                                fontFamily: 'kanit',
                                fontSize: 16,
                                color: Colors.limeAccent,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${controller.selectedTrainer.amount}€ /hour",
                              style: const TextStyle(
                                fontFamily: 'kanit',
                                fontSize: 16,
                                color: Colors.limeAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: 8, right: 10),
                        child: IconButton(
                          onPressed: () {
                            controller.favouriteTrainer.value =
                                !controller.favouriteTrainer.value;
                            if (controller.favouriteTrainer.value == true) {
                              Get.snackbar(
                                "Thank you!",
                                "${controller.selectedTrainer.name} added to your favorites",
                                snackPosition: SnackPosition.TOP,
                                colorText: Colors.white,
                                borderRadius: 10,
                                backgroundColor: Colors.green,
                              );
                            } else {
                              Get.snackbar(
                                "I'm Sorry",
                                "${controller.selectedTrainer.name} removed from your favorites",
                                snackPosition: SnackPosition.TOP,
                                colorText: Colors.white,
                                borderRadius: 10,
                                backgroundColor: Colors.red,
                              );
                            }
                          },
                          icon: controller.favouriteTrainer.value == true
                              ? const Icon(
                                  Icons.bookmark,
                                  color: Colors.limeAccent,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.bookmark_border,
                                  size: 30,
                                  color: Colors.limeAccent,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Container(
                    height: getProportionateScreenHeightByPercent(0.12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF222831),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.selectedTrainer.experience
                                      .toString(),
                                  style: const TextStyle(
                                    fontFamily: 'kanit',
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "Experience",
                                  style: TextStyle(
                                    fontFamily: 'kanit',
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.white,
                            height: 50,
                            width: 2,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.selectedTrainer.completedTrainings
                                      .toString(),
                                  style: const TextStyle(
                                    fontFamily: 'kanit',
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "Completed",
                                  style: TextStyle(
                                    fontFamily: 'kanit',
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.white,
                            height: 50,
                            width: 2,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.selectedTrainer.activeClients
                                      .toString(),
                                  style: const TextStyle(
                                    fontFamily: 'kanit',
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "Active Clients",
                                  style: TextStyle(
                                    fontFamily: 'kanit',
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Reviews",
                        style: TextStyle(
                          fontFamily: 'kanit',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.limeAccent),
                        child: Text(
                          controller.selectedTrainer.overallRating.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'kanit',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/no-image.png"),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/no-image.png"),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/no-image.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.limeAccent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text(
                                  "174",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'kanit',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].reversed.map((e) => e).toList(),
                      ),
                      const Text(
                        "Read all reviews",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'kanit',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.limeAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeightByPercent(0.2),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.reviews.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: getProportionateScreenWidthByPercent(0.8),
                        height: getProportionateScreenHeightByPercent(0.1),
                        child: CustomReviewCard(
                          rating: controller.reviews[index].rating,
                          image:
                              "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/no-image.png",
                          name: "Sharon Jem",
                          onPress: () {},
                          reviewedOn: "${index}d ago",
                          reviewComment: controller.reviews[index].review,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: getProportionateScreenWidthByPercent(0.8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.limeAccent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.APPOINTMENT);
                      },
                      child: const Text(
                        "Book Appointment",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
