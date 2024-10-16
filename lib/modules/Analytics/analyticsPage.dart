// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sensai/layout/bottom_nav/bottom_nav.dart';

// Project imports:
import '../../util/size_config.dart';
import './widgets/body.dart';

class AnalyticsPage extends StatelessWidget {
  static String routeName = "/analytics";

  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
