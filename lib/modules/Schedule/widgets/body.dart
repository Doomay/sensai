import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensai/routes/routes.dart';
import 'package:sensai/util/custom_schedule_card.dart';
import '../controller/scheduleController.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../../../util/size_config.dart';

class Body extends GetView<ScheduleController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarCarousel = CalendarCarousel<Event>(
      todayBorderColor: Colors.white,
      onDayPressed: (date, events) {
        controller.currentDate2 = date;
        Get.forceAppUpdate();
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: const TextStyle(
        color: Colors.white,
      ),
      iconColor: Colors.white,
      thisMonthDayBorderColor: Colors.transparent,
      markedDatesMap: controller.markedDateMap,
      height: getProportionateScreenHeightByPercent(0.5),
      selectedDateTime: controller.currentDate2,
      targetDateTime: controller.targetDateTime,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          const CircleBorder(side: BorderSide(color: Colors.yellow)),
      markedDateCustomTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      headerTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      showHeader: true,
      todayTextStyle: const TextStyle(
        color: Colors.black,
      ),
      todayButtonColor: Colors.limeAccent,
      selectedDayTextStyle: const TextStyle(
        color: Colors.black,
      ),
      minSelectedDate: controller.currentDate.subtract(const Duration(days: 360)),
      maxSelectedDate: controller.currentDate.add(const Duration(days: 360)),
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
        controller.targetDateTime = date;
        controller.currentMonth =
            DateFormat.yMMM().format(controller.targetDateTime);
      },
    );

    Future.delayed(Duration.zero, () async {
      controller.getAppointments(context);
    });

    return Obx(() {
      if (controller.appointmentsLoading == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (controller.appointmentList.value.isEmpty) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenHeightByPercent(0.6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF222831)),
                  child: Column(
                    children: [
                      calendarCarousel,
                      DateTime.now().subtract(const Duration(days: 1)).isBefore(
                              DateTime.parse(
                                  controller.currentDate2.toString()))
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:
                                    getProportionateScreenWidthByPercent(0.8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.limeAccent,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.TRAINERLIST);
                                  },
                                  child: const Text(
                                    "Book Appointment",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  width: 170,
                  child: Text(
                    "Looks like your schedule is sitting idle!",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeightByPercent(0.6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF222831)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: calendarCarousel,
                    ),
                    DateTime.now().subtract(const Duration(days: 1)).isBefore(
                            DateTime.parse(controller.currentDate2.toString()))
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: getProportionateScreenWidthByPercent(0.8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.limeAccent,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.TRAINERLIST);
                                },
                                child: const Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: controller.appointmentList.map((element) {
                  return CustomScheduleCard(
                    date: controller.formatter
                        .format(DateTime.parse(element.bookDate))
                        .toString(),
                    time: controller.formatDate(TimeOfDay(
                        hour: int.parse(
                            element.bookTime.toString().substring(0, 2)),
                        minute: int.parse(
                            element.bookTime.toString().substring(3, 5)))),
                    name: element.name,
                    onPress: () {
                      controller.trainerId = element.trainerId;
                      Get.toNamed(Routes.TRAINERDETAILS);
                    },
                    rating: element.rating,
                    trainingType: "High Intensity Training",
                    experience: 17,
                    place: "Paris",
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    });
  }
}
