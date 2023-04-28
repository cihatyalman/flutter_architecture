// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';

class DataNotifier<T> {
  late ValueNotifier<T> _dataListener;

  DataNotifier(T initialValue) {
    _dataListener = ValueNotifier<T>(initialValue);
  }

  T get value => _dataListener.value;
  set value(T value) => _dataListener.value = value;

  Widget listenWidget(Widget Function(T data) customWidget) =>
      ValueListenableBuilder<T>(
        valueListenable: _dataListener,
        builder: (_, value, __) => customWidget.call(value),
      );

  void get updateWidget => _dataListener.notifyListeners();
}
