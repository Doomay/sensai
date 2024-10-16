import 'package:flutter/material.dart';

class CustomProfileButton extends StatelessWidget {
  final String? title;
  final bool? showIcon;
  final Color? textColor;
  final Function()? onPress;

  const CustomProfileButton(
      {super.key, this.title, this.showIcon, this.textColor, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: TextButton(
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title!,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
              showIcon == true
                  ? const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.white,
                      size: 35,
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
