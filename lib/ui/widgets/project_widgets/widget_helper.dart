import 'package:flutter/material.dart';

final hw = WidgetHelper();

class WidgetHelper {
  Widget circleLoading({Color? color}) => Center(
        child: CircularProgressIndicator(
          color: color ?? Colors.black,
        ),
      );
}
