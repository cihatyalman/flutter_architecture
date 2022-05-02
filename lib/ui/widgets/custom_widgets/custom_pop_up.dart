import 'package:flutter/material.dart';

import '../../../exports/export_business.dart';
import '../../../exports/export_core.dart';

class CustomPopUp with ContextMixin {
  List<Widget> children;
  Color backgroundColor;
  double padding;
  double? width;
  double? height;

  CustomPopUp({
    required this.children,
    this.backgroundColor = Colors.white,
    this.padding = 8,
    this.width,
    this.height,
  });

  show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // Design
        contentPadding: EdgeInsets.zero,
        insetPadding: hd.paddingAll(),
        backgroundColor: Colors.transparent,
        elevation: 0,

        content: Container(
          padding: hd.paddingAll(padding),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: hd.radius(12),
          ),
          width: width ?? dynamicWidth(1),
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }
}
