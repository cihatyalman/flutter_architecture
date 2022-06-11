// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../project_widgets/c_text.dart';
import '../project_widgets/widget_helper.dart';
import 'custom_future_widget.dart';

class SubmitButton extends StatelessWidget {
  String? title;
  Future<void> Function() onTap;
  Color backgroundColor;
  Color borderColor;
  Color textColor;
  double radius;
  double height;
  bool isEnabled;
  double elevation;

  SubmitButton({
    this.title,
    required this.onTap,
    this.backgroundColor= Colors.white,
    this.borderColor = Colors.black,
    this.textColor = Colors.black,
    this.radius = 8,
    this.height = 48,
    this.isEnabled = true,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFutureWidget(
      builder: (isLoading) => IgnorePointer(
        ignoring: !isEnabled,
        child: MaterialButton(
          onPressed: isLoading.value
              ? null
              : () async {
                  isLoading.value = true;
                  await onTap.call();
                  isLoading.value = false;
                },
          padding: const EdgeInsets.all(8),
          color: backgroundColor,
          elevation: elevation,
          focusElevation: 0,
          hoverElevation: 0,
          disabledElevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: hw.radius(radius),
            side: BorderSide(color: borderColor),
          ),
          height: height,
          child: isLoading.value
              ? hw.circleLoading()
              : Center(
                  child: CText(
                  title,
                  color: textColor,
                  textAlign: TextAlign.center,
                  isOverflow: true,
                )),
        ),
      ),
    );
  }
}
