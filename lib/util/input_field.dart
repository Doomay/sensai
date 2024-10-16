// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../util/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final Function? onTap;
  final ValueChanged<String>? onChanged;
  final Function? onEditingComplete;
  final bool obscureText;
  final TextInputType? textInputType;
  final Function(String?)? onSaved;
  final bool autocorrect;
  //final FormFieldValidator<String> validator;
  final String? Function(String?)? validator;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? controller;
  final int maxLines;
  final int maxLength;
  final double scrollPadding;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool autovalidate;
  final bool hideCounter;
  final String? hintText;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool enabled;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.textInputType,
    this.onSaved,
    this.autocorrect = false,
    this.obscureText = false,
    this.validator,
    this.errorText,
    this.focusNode,
    this.initialValue,
    this.controller,
    this.maxLines = 1,
    this.maxLength = 150,
    this.scrollPadding = 20.0,
    this.inputFormatters,
    this.autovalidate = false,
    this.hideCounter = false,
    this.hintText,
    this.textInputAction,
    this.suffix,
    this.suffixIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        textInputAction: textInputAction,
        autovalidateMode:
            autovalidate == true ? AutovalidateMode.onUserInteraction : null,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        controller: controller,
        initialValue: initialValue,
        scrollPadding: EdgeInsets.all(scrollPadding),
        onTap: onTap as void Function()?,
        focusNode: focusNode,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete as void Function()?,
        cursorColor: Get.theme.primaryColor,
        style: inputFieldTextStyle,
        obscureText: obscureText,
        keyboardType: textInputType,
        onSaved: onSaved,
        autocorrect: autocorrect,
        validator: validator,
        enabled: enabled,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            suffix: suffix,
            hintText: hintText,
            errorText: errorText,
            labelText: labelText,
            labelStyle: inputFieldLabelTextStyle,
            floatingLabelStyle: const TextStyle(color: Colors.white),
            hintStyle: inputFieldHintTextStyle,
            focusedBorder: inputFieldFocusedBorderStyle,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            border: inputFieldDefaultBorderStyle,
            enabledBorder: enabledInputBorderStyle,
            counterText: ''),
      ),
    );
  }
}
