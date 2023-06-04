// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../project_widgets/widget_helper.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isCheck;
  final Color color;
  final Color checkColor;
  final Color borderColor;
  final double size;
  final double radius;

  CustomCheckBox({
    this.isCheck = false,
    this.color = Colors.blue,
    this.checkColor = Colors.black,
    this.borderColor = Colors.grey,
    this.size = 20,
    this.radius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isCheck ? color : Colors.transparent,
        borderRadius: hw.radius(radius),
        border: Border.all(
          width: 2,
          color: isCheck ? color : borderColor,
        ),
      ),
      child: !isCheck
          ? null
          : Icon(Icons.check, color: checkColor, size: size - 8),
    );
  }
}
