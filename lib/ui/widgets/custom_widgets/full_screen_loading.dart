import 'dart:async';
import 'package:flutter/material.dart';
import '../../../exports/export_widgets.dart';

class FullScreenLoading {
  Widget? child;
  Duration? autoClose;

  FullScreenLoading({this.child, this.autoClose});

  Timer? _timer;

  show(BuildContext context) {
    if (autoClose != null) {
      _timer = Timer(autoClose!, () => close(context));
    }
    return showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      builder: (context) {
        return child ?? Center(child: hw.circleLoading(color: Colors.white));
      },
    );
  }

  close(BuildContext context) {
    Navigator.pop(context);
    _timer?.cancel();
    _timer = null;
  }
}
