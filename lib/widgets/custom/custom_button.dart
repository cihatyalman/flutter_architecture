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
  double? width;
  double height;
  bool isEnabled;
  double elevation;
  Alignment alignment;
  double padding;
  bool isExpanded;

  CustomButton({
    super.key,
    this.title,
    this.titleWidget,
    required this.onTap,
    this.backgroundColor = ColorConstants.primaryColor,
    this.borderColor,
    this.textColor = Colors.white,
    this.loadingColor,
    this.radius = 8,
    this.width,
    this.height = 48,
    this.isEnabled = true,
    this.elevation = 0,
    this.alignment = Alignment.center,
    this.padding = 12,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded ? Expanded(child: _buildWidget()) : _buildWidget();
  }

  Widget _buildWidget() {
    return SizedBox(
      width: width,
      height: height,
      child: CustomFutureWidget(
        builder: (isLoading) => MaterialButton(
          onPressed: !isEnabled
              ? null
              : isLoading.value
                  ? null
                  : () async {
                      isLoading.value = true;
                      await onTap.call();
                      isLoading.value = false;
                    },
          padding: EdgeInsets.symmetric(horizontal: padding),
          color: backgroundColor,
          disabledColor: isLoading.value ? Colors.white : Colors.grey,
          textColor: Colors.black,
          elevation: elevation,
          focusElevation: 0,
          hoverElevation: 0,
          disabledElevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: hw.radius(radius),
            side: !isEnabled
                ? const BorderSide(color: Colors.grey)
                : borderColor == null
                    ? BorderSide(color: backgroundColor)
                    : BorderSide(color: borderColor!),
          ),
          child: isLoading.value
              ? hw.circleLoading(color: loadingColor ?? backgroundColor)
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
    );
  }
}
