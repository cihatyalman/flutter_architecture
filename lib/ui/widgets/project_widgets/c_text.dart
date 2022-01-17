// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../../../exports/export_business.dart';

class CText extends Text {
  CText(
    String data, {
    // use default values or nullable depending on the project
    double size = 14,
    Color color = ColorConstants.textColor,
    bool isBold = false,
    TextAlign? textAlign,
  }) : super(
          data,
          textScaleFactor: 1,
          textAlign: textAlign,
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: isBold ? FontWeight.bold : null,
          ),
        );
}
