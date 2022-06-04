// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:async';
import 'package:flutter/material.dart';

class CustomTimerBar extends StatelessWidget {
  int time;
  final double? height;
  final double radius;
  final Color backgroundColor;
  final Color foregroundColor;
  final void Function()? callback;
  bool? isComplete;

  CustomTimerBar({
    this.time = 5,
    this.height,
    this.radius = 16,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.callback,
    this.isComplete,
  });

  final timerTick = ValueNotifier(0);
  Timer? timer;

  bool _isPause = true;

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
            value: isComplete == null
                ? double.tryParse(
                    (value / (time * 1000)).toString(),
                  )
                : isComplete!
                    ? 1
                    : 0,
          ),
        );
      },
    );
  }

  start({int initialValue = 0}) {
    stop();
    isComplete = null;
    _isPause = false;
    timerTick.value = initialValue;
    timer = Timer.periodic(
      const Duration(milliseconds: 1),
      (timer) {
        if (!_isPause) {
          timerTick.value += 1;
          if (timerTick.value > (time * 1000)) {
            timerTick.value = 0;
            _isPause = true;
            timer.cancel();
            isComplete = true;
            callback?.call();
          }
        }
      },
    );
  }

  stop() {
    _isPause = true;
    timer?.cancel();
  }

  playOrPause({bool? isPause}) {
    _isPause = !_isPause;
    if (isPause != null) {
      _isPause = isPause;
    }
    final tempValue = timerTick.value;
    if (_isPause) {
      stop();
    } else {
      start(initialValue: tempValue);
    }
  }

  changeComplete(bool? isComplete) {
    this.isComplete = isComplete;
  }

  changeTime(int? time) {
    this.time = time ?? 5;
    timerTick.notifyListeners();
  }
}
