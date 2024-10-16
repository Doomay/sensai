// Flutter imports:
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final icon;
  final String? title;
  final Function? press;
  final bool isActive;
  const BottomNavItem({
    super.key,
    this.icon,
    this.title,
    this.press,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Container(
              width: isActive ? 50 : 50,
              height: 30,
              decoration: isActive
                  ? BoxDecoration(
                      color: Colors.lime,
                      borderRadius: BorderRadius.circular(20),
                    )
                  : const BoxDecoration(),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Text(
              title!,
              style: const TextStyle(color: Colors.limeAccent),
            ),
          ],
        ),
      ),
    );
  }
}
