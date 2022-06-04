import 'package:flutter/material.dart';

import '../../../exports/export_business.dart';

class CustomPopUp {
  List<Widget> children;
  Color backgroundColor;
  double padding;
  double? width;
  double? height;
  bool dismiss;

  CustomPopUp({
    required this.children,
    this.backgroundColor = Colors.white,
    this.padding = 8,
    this.width,
    this.height,
    this.dismiss = true,
  });

  Future show(BuildContext context) => showDialog(
        barrierDismissible: dismiss,
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
            width: width ?? MediaQuery.of(context).size.width,
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      );
}
