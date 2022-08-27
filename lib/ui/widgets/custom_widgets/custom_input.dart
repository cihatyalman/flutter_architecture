// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  TextEditingController? controller;
  void Function(String? value)? onChanged;
  String? labelText;
  String? hintText;
  String? helperText;
  String? errorText;
  TextStyle? textStyle;
  TextStyle? hintStyle;
  TextStyle? helperStyle;
  TextStyle? errorStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputMaskList;
  bool obscureText;
  int? maxLines;
  int? maxLength;
  double radius;
  EdgeInsets contentPadding;
  bool readOnly;
  // 0: None - 1: OutlineInputBorder - 2: UnderlineInputBorder
  int borderType;
  Color borderPassiveColor;
  Color borderActiveColor;
  Color? backgroundColor;
  TextCapitalization textCapitalization;

  CustomInput({
    this.controller,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.textStyle,
    this.hintStyle,
    this.helperStyle,
    this.errorStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.inputMaskList,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.radius = 8,
    this.contentPadding = EdgeInsets.zero,
    this.readOnly = false,
    this.borderType = 0,
    this.borderPassiveColor = Colors.grey,
    this.borderActiveColor = Colors.black,
    this.backgroundColor,
    this.textCapitalization = TextCapitalization.none,
  }) : assert(!obscureText || maxLines == 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          labelText: labelText,
          hintText: hintText,
          helperText: helperText,
          errorText: errorText,
          hintStyle: hintStyle,
          helperStyle: helperStyle,
          errorStyle: errorStyle,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: _border(borderPassiveColor),
          focusedBorder: _border(borderActiveColor),
          enabledBorder: _border(borderPassiveColor),
        ),
        style: textStyle,
        keyboardType: keyboardType,
        inputFormatters: inputMaskList,
        obscureText: obscureText,
        maxLines: maxLines,
        maxLength: maxLength,
        readOnly: readOnly,
        textCapitalization: textCapitalization,
      ),
    );
  }

  InputBorder _border(Color color) => borderType == 1
      ? OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: BorderRadius.circular(radius),
        )
      : borderType == 2
          ? UnderlineInputBorder(
              borderSide: BorderSide(color: color),
              borderRadius: BorderRadius.circular(radius),
            )
          : InputBorder.none;
}
