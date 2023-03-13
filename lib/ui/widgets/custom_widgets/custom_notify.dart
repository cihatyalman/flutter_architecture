import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

import '../../../business/helpers/design_helper.dart';
import '../project_widgets/c_text.dart';

enum NotifyType { success, warning, error }

class CustomNotify {
  final String? title;
  final String? message;
  final NotifyType? type;
  final TextStyle? style;
  final Function()? onPressed;
  final int durationSeconds;

  CustomNotify({
    this.title,
    required this.message,
    this.type = NotifyType.error,
    this.style,
    this.onPressed,
    this.durationSeconds = 3,
  });

  show(BuildContext context) => _build().show(context);

  Flushbar _build() {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(12),
      backgroundColor: _getColor(type ?? NotifyType.error),
      duration: Duration(seconds: durationSeconds),
      isDismissible: true,
      titleText: title != null
          ? Text(
              title!,
              style: style ?? hd.textStyle(color: Colors.white),
            )
          : null,
      messageText: CText(
        message ?? "ERROR",
        style: style ?? hd.textStyle(color: Colors.white),
      ),
      onTap: (flushbar) {
        onPressed?.call();
      },
    );
  }

  Color _getColor(NotifyType type) {
    switch (type) {
      case NotifyType.success:
        return Colors.green;
      case NotifyType.warning:
        return Colors.orange;
      case NotifyType.error:
        return Colors.red;
      default:
        return Colors.red;
    }
  }
}
