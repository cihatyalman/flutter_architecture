import 'package:flutter/material.dart';

class CustomPopUp {
  final List<Widget> children;
  final double widthMargin;
  final double padding;
  final Color backgroundColor;
  final double radius;

  CustomPopUp({
    required this.children,
    this.widthMargin = 0,
    this.padding = 8,
    this.backgroundColor = Colors.white,
    this.radius = 12,
  });

  show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // Design
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        elevation: 0,

        // Controller
        content: Container(
          margin: EdgeInsets.all(widthMargin),
          padding: EdgeInsets.all(padding),
          width: 1000,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      ),
    );
  }
}
