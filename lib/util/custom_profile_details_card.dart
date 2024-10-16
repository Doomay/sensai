import 'package:flutter/material.dart';

class CustomProfileDetailsCard extends StatelessWidget {
  final String? firstLine;
  final String? secondLine;

  const CustomProfileDetailsCard({super.key, this.firstLine, this.secondLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color(0xFF222831),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            firstLine!,
            style: const TextStyle(color: Colors.limeAccent, fontSize: 16),
          ),
          Text(
            secondLine!,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
