import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:http/http.dart' as http;
import 'package:sensai/data/model/review.dart';
import 'package:sensai/modules/SignUp/controller/signUpController.dart';
import '../../../data/model/appointment.dart';
import '../../../data/model/trainer.dart';
import '../../../routes/routes.dart';

class ScheduleController extends GetxController {
  static ScheduleController get to => Get.find();
  DateTime currentDate = DateTime.now();
  DateTime currentDate2 = DateTime.now();
  String currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime targetDateTime = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final DateFormat appointmentFormatter = DateFormat('dd MMMM yyyy');
  final DateFormat timeFormatter = DateFormat.jm();

  DateTime appointmentCurrentDate = DateTime.now();
  Rx<DateTime> appointmentCurrentDate2 = DateTime.now().obs;
  String appointmentCurrentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime appointmentTargetDateTime = DateTime.now();
  final RxString selectedTime = "".obs;
  final RxBool isLoading = false.obs;
  final RxBool trainerListLoading = false.obs;
  final RxBool appointmentsLoading = false.obs;
  final RxBool trainerLoading = false.obs;
  int trainerId = 0;
  final trainerList = RxList<Trainer>();
  Trainer selectedTrainer = Trainer();
  DateFormat dayName = DateFormat.EEEE();
  final appointmentList = RxList<Appointment>();
  final RxBool favouriteTrainer = false.obs;

  List<String> timeSlotHours = [];

  get markedDateMap => null;

  get reviews => null;

  // Correct access of appUser student_id
  Future<List<Appointment>> getAppointments(BuildContext context) async {
    appointmentsLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse(
            'http://localhost:8080/get_appointments'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "student_id": Get.find<SignUpController>().appUser.value?['student_id']
        }),
      );
      appointmentsLoading.value = false;
      return appointmentList.value = (jsonDecode(response.body) as List)
          .map((json) => Appointment.fromMap(json))
          .toList();
    } catch (error) {
      appointmentsLoading.value = false;
      throw Exception("Unable to fetch appointments");
    }
  }

  formatDate(TimeOfDay timeOfDay) {}

  void timeSlots(DateTime date) {}

  void bookAppointment(BuildContext context) {}

  void getTrainers(BuildContext context) {}

  void getTrainerById(BuildContext context) {}

  // Remaining methods...
}
