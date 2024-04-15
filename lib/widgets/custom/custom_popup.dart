import 'package:flutter/material.dart';

import '../project/widget_helper.dart';

class CustomPopUp {
  List<Widget> children;
  Color backgroundColor;
  double padding;
  double? width;
  double? height;
  bool dismiss;
  double radius;

  CustomPopUp({
    required this.children,
    this.backgroundColor = Colors.white,
    this.padding = 8,
    this.width = 1000,
    this.height,
    this.dismiss = true,
    this.radius = 12,
  });

  Future show(BuildContext context) => showDialog(
        barrierDismissible: dismiss,
        context: context,
        builder: (context) => AlertDialog(
          // Design
          contentPadding: EdgeInsets.zero,
          insetPadding: hw.paddingAll(),
          backgroundColor: Colors.transparent,
          elevation: 0,

          content: Container(
            padding: hw.paddingAll(padding),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: hw.radius(radius),
            ),
            width: width,
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      );
}
