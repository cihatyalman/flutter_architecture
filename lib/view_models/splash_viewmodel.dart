// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';

import '../core/utils/mixins/context_mixin.dart';

enum StatusType { idle, loading, isTrue, isFalse }

class SplashViewModel {
  final _statusListener = ValueNotifier(StatusType.idle);
  Widget listenWidget(Widget Function(StatusType data) customWidget) =>
      ValueListenableBuilder<StatusType>(
        valueListenable: _statusListener,
        builder: (_, value, __) => customWidget.call(value),
      );
  void get updateWidget => _statusListener.notifyListeners();

  void setScreenSize(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
  }

  void startFunction() async {
    _statusListener.value = StatusType.loading;
    await Future.delayed(const Duration(seconds: 3));
    _statusListener.value = StatusType.isTrue;
  }
}
