// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../business/helpers/design_helper.dart';
import '../../../exports/export_business.dart' show ColorConstants;

class CText extends StatelessWidget {
  String? data;
  double size;
  Color color;
  bool isBold;
  TextAlign? textAlign;
  TextStyle? style;
  int? maxLines;
  bool isOverflow;

  CText(
    this.data, {
    this.size = 14,
    this.color = ColorConstants.textColor,
    this.isBold = false,
    this.textAlign,
    this.style,
    this.maxLines,
    this.isOverflow = false,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      data ?? "",
      textScaleFactor: 1,
      textAlign: textAlign,
      maxLines: maxLines,
      style: style ??
          hd
              .textStyle()
              .copyWith(overflow: isOverflow ? TextOverflow.ellipsis : null),
    );
  }
}
