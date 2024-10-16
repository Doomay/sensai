// Package imports:
import 'package:get/get.dart';
import 'package:sensai/modules/Age/ageScreen.dart';
import 'package:sensai/modules/Appointment/appointmentPage.dart';
import 'package:sensai/modules/Gender/genderScreen.dart';
import 'package:sensai/modules/Goal/goalScreen.dart';
import 'package:sensai/modules/Height/heightScreen.dart';
import 'package:sensai/modules/Home/HomePage.dart';
import 'package:sensai/modules/PaymentDone/paymentDonePage.dart';
import 'package:sensai/modules/PhysicalActivity/physicalActivity.dart';
import 'package:sensai/modules/Profile/profilePage.dart';
import 'package:sensai/modules/Schedule/schedulePage.dart';
import 'package:sensai/modules/SignUp/SignUpScreen.dart';
import 'package:sensai/modules/TrainerDetails/TrainerDetails.dart';
import 'package:sensai/modules/TrainerList/trainerListPage.dart';
import 'package:sensai/modules/Weight/weightScreen.dart';
// Project imports:

import '../modules/Analytics/analyticsPage.dart';
import '../modules/Splash/SplashScreen.dart';
import 'routes.dart';

abstract class Pages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page: () => const SplashPage()),
    GetPage(name: Routes.SIGNUP, page: () => const SignUpPage()),
    GetPage(name: Routes.GENDER, page: () => const GenderPage()),
    GetPage(name: Routes.WEIGHT, page: () => const WeightPage()),
    GetPage(name: Routes.AGE, page: () => const AgePage()),
    GetPage(name: Routes.HEIGHT, page: () => const HeightPage()),
    GetPage(name: Routes.GOAL, page: () => GoalScreen()), // Remove const if dynamic data is involved
    GetPage(name: Routes.PHYSICALACTIVITY, page: () => const PhysicalActivityPage()),
    GetPage(name: Routes.HOME, page: () => const HomePage()),
    GetPage(name: Routes.ANALYTICS, page: () => const AnalyticsPage()),
    GetPage(name: Routes.PROFILE, page: () => const ProfilePage()),
    GetPage(name: Routes.SCHEDULE, page: () => const SchedulePage()),
    GetPage(name: Routes.TRAINERLIST, page: () => const TrainerListPage()),
    GetPage(name: Routes.TRAINERDETAILS, page: () => const TrainerDetailsPage()),
    GetPage(name: Routes.APPOINTMENT, page: () => const AppointmentPage()),
    GetPage(name: Routes.PAYMENTDONE, page: () => const PaymentDonePage()),
  ];
}



