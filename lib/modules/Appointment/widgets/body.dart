import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:sensai/util/custom_trainer_appointment_card.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../../Schedule/controller/scheduleController.dart';
import '../../../util/size_config.dart';

class Body extends GetView<ScheduleController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.timeSlotHours.isEmpty) {
      controller.timeSlots(DateTime.now());
    }
    final calendarCarousel = CalendarCarousel<Event>(
      todayBorderColor: Colors.white,
      onDayPressed: (date, events) {
        controller.appointmentCurrentDate2.value = date;
        if (date == DateTime.now()) {
          controller.timeSlots(DateTime.now());
        } else {
          controller.timeSlots(date);
        }
        Get.forceAppUpdate();
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: const TextStyle(
        color: Colors.white,
      ),
      headerTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      iconColor: Colors.white,
      thisMonthDayBorderColor: Colors.transparent,
      markedDatesMap: controller.markedDateMap,
      height: getProportionateScreenHeightByPercent(0.5),
      selectedDateTime: controller.appointmentCurrentDate2.value,
      targetDateTime: controller.appointmentTargetDateTime,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          const CircleBorder(side: BorderSide(color: Colors.yellow)),
      markedDateCustomTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      showHeader: true,
      todayTextStyle: const TextStyle(
        color: Colors.black,
      ),
      todayButtonColor: Colors.limeAccent,
      selectedDayTextStyle: const TextStyle(
        color: Colors.black,
      ),
      minSelectedDate:
          controller.appointmentCurrentDate.subtract(const Duration(days: 1)),
      maxSelectedDate:
          controller.appointmentCurrentDate.add(const Duration(days: 360)),
      prevDaysTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      inactiveWeekendTextStyle: const TextStyle(color: Colors.white),
      inactiveDaysTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      weekdayTextStyle: const TextStyle(color: Colors.white),
      daysTextStyle: const TextStyle(color: Colors.white),
      onCalendarChanged: (DateTime date) {
        controller.appointmentTargetDateTime = date;
        controller.appointmentCurrentMonth =
            DateFormat.yMMM().format(controller.appointmentTargetDateTime);
      },
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomTrainerAppointmentCard(
                onPress: () {},
                name: controller.selectedTrainer.name.toString(),
                rating: controller.selectedTrainer.overallRating.toString(),
                trainingType: controller.selectedTrainer.type.toString() != "-"
                    ? controller.selectedTrainer.type.toString()
                    : "High Intensity Tranining",
                experience: controller.selectedTrainer.experience,
                image: controller.selectedTrainer.imagePath != null
                    ? "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/${controller.selectedTrainer.imagePath!}"
                    : "http://ec2-13-37-35-200.eu-west-3.compute.amazonaws.com:8080/images/no-image.png",
                charge: controller.selectedTrainer.amount.toString(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: getProportionateScreenHeightByPercent(0.6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF222831)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: calendarCarousel,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      child: ListView.builder(
                        itemCount: controller.timeSlotHours.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => GestureDetector(
                              onTap: () {
                                controller.selectedTime.value =
                                    controller.timeSlotHours[index];
                              },
                              child: Container(
                                height: 40,
                                width: 90,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.limeAccent,
                                    ),
                                    color: controller.selectedTime ==
                                            controller.timeSlotHours[index]
                                        ? Colors.limeAccent
                                        : Colors.black),
                                child: Center(
                                  child: Text(
                                    controller.timeSlotHours[index].toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: controller.selectedTime ==
                                              controller.timeSlotHours[index]
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              if (controller.isLoading.value == true) {
                return const CircularProgressIndicator();
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: getProportionateScreenWidthByPercent(0.8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.limeAccent,
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (controller.selectedTime == "") {
                        Get.snackbar(
                          "Error",
                          "Please select a timeslot to continue",
                          snackPosition: SnackPosition.TOP,
                          colorText: Colors.white,
                          borderRadius: 10,
                          backgroundColor: Colors.red,
                        );
                      } else {
                        controller.bookAppointment(context);
                      }
                    },
                    child: const Text(
                      "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
