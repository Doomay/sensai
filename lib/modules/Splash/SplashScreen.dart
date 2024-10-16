// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../util/size_config.dart';
import './widgets/body.dart';

class SplashPage extends StatelessWidget {
  static String routeName = "/splash";

  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Colors.black,
      body: splashscreen(),
    );
  }
}
