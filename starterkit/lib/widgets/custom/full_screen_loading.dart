import 'dart:async';
import 'package:flutter/material.dart';

class FullScreenLoading {
  Widget? child;
  Duration? autoClose;
  Color? barrierColor;

  FullScreenLoading({this.child, this.autoClose, this.barrierColor});

  Timer? _timer;

  Future<dynamic> show(BuildContext context) {
    if (autoClose != null) {
      _timer = Timer(autoClose!, () => close(context));
    }
    return showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      barrierColor: barrierColor,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: child ?? _circleLoading(),
      ),
    );
  }

  void close(BuildContext context) {
    Navigator.pop(context);
    _timer?.cancel();
    _timer = null;
  }

  Widget _circleLoading() {
    return Center(
      child: SizedBox.square(
        dimension: 24,
        child: CircularProgressIndicator(strokeWidth: 4),
      ),
    );
  }
}
