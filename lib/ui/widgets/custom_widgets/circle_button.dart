// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../project_widgets/widget_helper.dart';
import 'custom_future_widget.dart';

class CircleButton extends StatelessWidget {
  Widget icon;
  double size;
  Future<void> Function()? onPressed;
  Color backgroundColor;
  double? elevation;
  bool isEnabled;

  CircleButton({
    required this.icon,
    required this.onPressed,
    this.size = 48,
    this.backgroundColor = Colors.white,
    this.elevation,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFutureWidget(
      builder: (isLoading) => SizedBox(
        width: size,
        height: size,
        child: IgnorePointer(
          ignoring: !isEnabled,
          child: MaterialButton(
            onPressed: isLoading.value
                ? null
                : () async {
                    isLoading.value = true;
                    await onPressed?.call();
                    isLoading.value = false;
                  },
            padding: EdgeInsets.zero, //-
            color: backgroundColor,
            elevation: elevation,
            focusElevation: 0,
            hoverElevation: 0,
            disabledElevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(borderRadius: hw.radius(200)), //-
            child: isLoading.value
                ? hw.circleLoading()
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(child: icon),
                      if (!isEnabled)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.8),
                            borderRadius: hw.radius(100),
                          ),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
