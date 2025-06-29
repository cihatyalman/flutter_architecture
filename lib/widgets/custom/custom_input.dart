import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  TextEditingController? controller;
  void Function(String? value)? onChanged;
  void Function(String? value)? onSubmitted;
  void Function()? onTap;
  String? initialValue;
  String? labelText;
  String? hintText;
  String? errorText;
  TextStyle? textStyle;
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
  TextAlign textAlign;
  TextCapitalization textCapitalization;

  CustomInput({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.errorText,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.inputMaskList,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.radius = 8,
    this.contentPadding = const EdgeInsets.all(8),
    this.readOnly = false,
    this.borderType = 0,
    this.borderPassiveColor = Colors.grey,
    this.borderActiveColor = Colors.black,
    this.backgroundColor,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
  }) : assert(!obscureText || maxLines == 1);

  @override
  Widget build(BuildContext context) {
    if (![controller, initialValue].contains(null)) {
      controller!.text = initialValue!;
    }
    return TextField(
      controller: (controller ?? TextEditingController(text: initialValue)),
      onChanged: (value) =>
          onChanged?.call(value.trim().isEmpty ? null : value),
      onSubmitted: (value) =>
          onSubmitted?.call(value.trim().isEmpty ? null : value),
      onTap: onTap,
      decoration: InputDecoration(
        filled: backgroundColor != null,
        fillColor: backgroundColor,
        contentPadding: contentPadding,
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: _border(borderPassiveColor),
        focusedBorder: _border(borderActiveColor),
        enabledBorder: _border(borderPassiveColor),
        helperMaxLines: 3,
        errorMaxLines: 3,
        alignLabelWithHint: true,
      ),
      cursorColor: Colors.black,
      style: textStyle,
      keyboardType: keyboardType,
      inputFormatters: inputMaskList,
      obscureText: obscureText,
      maxLines: maxLines,
      maxLength: maxLength,
      readOnly: readOnly,
      textAlign: textAlign,
      textCapitalization: textCapitalization,
      textAlignVertical: (prefixIcon != null || suffixIcon != null)
          ? TextAlignVertical.center
          : null,
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
          : OutlineInputBorder(
              borderSide: BorderSide(color: backgroundColor ?? Colors.black),
              borderRadius: BorderRadius.circular(radius),
            );
}
