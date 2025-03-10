// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../project/c_text.dart';
import '../project/widget_helper.dart';
import 'custom_future_widget.dart';

class CustomButton extends StatelessWidget {
  String? title;
  Widget? titleWidget;
  Future<void> Function() onTap;
  Color backgroundColor;
  Color? borderColor;
  Color textColor;
  Color? loadingColor;
  double radius;
  double height;
  bool isEnabled;
  double elevation;
  Alignment alignment;
  double padding;
  bool isExpanded;

  CustomButton({
    this.title,
    this.titleWidget,
    required this.onTap,
    this.backgroundColor = ColorConstants.primaryColor,
    this.borderColor,
    this.textColor = Colors.black,
    this.loadingColor,
    this.radius = 8,
    this.height = 48,
    this.isEnabled = true,
    this.elevation = 0,
    this.alignment = Alignment.center,
    this.padding = 12,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded ? Row(children: [Expanded(child: _button())]) : _button();
  }

  Widget _button() {
    return SizedBox(
      height: height,
      child: CustomFutureWidget(
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
            padding: EdgeInsets.all(padding),
            color: backgroundColor,
            textColor: Colors.black,
            elevation: elevation,
            focusElevation: 0,
            hoverElevation: 0,
            disabledElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: hw.radius(radius),
              side: borderColor == null
                  ? BorderSide(color: backgroundColor)
                  : BorderSide(color: borderColor!),
            ),
            height: height,
            child: isLoading.value
                ? AspectRatio(
                    aspectRatio: 1,
                    child: hw.circleLoading(
                        color: loadingColor ?? backgroundColor),
                  )
                : titleWidget ??
                    Align(
                      alignment: alignment,
                      child: CText(
                        title,
                        color: textColor,
                        isBold: true,
                        textAlign: TextAlign.center,
                        isOverflow: true,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
