// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';

class CustomTimerBar extends StatelessWidget {
  final int time;
  final double? height;
  final double radius;
  final Color backgroundColor;
  final Color foregroundColor;
  final void Function()? callback;

  CustomTimerBar({
    this.time = 5,
    this.height,
    this.radius = 16,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.callback,
  });

  final timerTick = ValueNotifier(0);
  Timer? timer;

  bool _isPause = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: timerTick,
      builder: (_, value, __) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: LinearProgressIndicator(
            backgroundColor: backgroundColor,
            color: foregroundColor,
            value: double.tryParse(
              (value / (time * 1000)).toString(),
            ),
          ),
        );
      },
    );
  }

  start({int initialValue = 0}) {
    stop();
    timerTick.value = initialValue;
    timer = Timer.periodic(
      const Duration(milliseconds: 1),
      (timer) {
        if (!_isPause) {
          timerTick.value += 1;
          if (timerTick.value > (time * 1000)) {
            timer.cancel();
            callback?.call();
          }
        }
      },
    );
  }

  stop() {
    timer?.cancel();
  }

  playOrPause() {
    _isPause = !_isPause;
    final tempValue = timerTick.value;
    if (_isPause) {
      stop();
    } else {
      start(initialValue: tempValue);
    }
  }
}
