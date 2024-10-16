import 'package:flutter/material.dart';
import 'package:sensai/modules/Goal/widgets/body.dart';


class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: goalBody(),  // The Body widget is where your actual content will go
        ),
      ),
    );
  }
}
