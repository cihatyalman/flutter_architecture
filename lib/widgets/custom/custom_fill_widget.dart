// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomFillWidget extends StatelessWidget {
  Widget child;
  double value;
  double width;
  double height;
  Color backgroundColor;
  Color forgroundColor;
  bool isHorizontal;
  double radius;
  Alignment? alignment;

  CustomFillWidget({
    super.key,
    required this.child,
    this.value = 0,
    this.width = 112,
    this.height = 56,
    this.backgroundColor = Colors.black,
    this.forgroundColor = Colors.white,
    this.isHorizontal = true,
    this.radius = 12,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: Stack(
          alignment: alignment ??
              (isHorizontal ? Alignment.centerLeft : Alignment.bottomCenter),
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: backgroundColor),
            ),
            Container(
              width: isHorizontal ? width * value : double.infinity,
              height: isHorizontal ? double.infinity : height * value,
              decoration: BoxDecoration(color: forgroundColor),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
