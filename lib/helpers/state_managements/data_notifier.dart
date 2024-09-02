// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';

class DataNotifier<T> {
  late ValueNotifier<T> _dataListener;
  DataNotifier(T initialValue) {
    _dataListener = ValueNotifier<T>(initialValue);
  }

  bool _isLoading = false;

  void get activateLoading {
    _isLoading = true;
    updateWidget;
  }

  void get deactivateLoading {
    if (_isLoading) {
      _isLoading = false;
      updateWidget;
    }
  }

  T get value => _dataListener.value;
  set value(T value) => _dataListener.value = value;

  Widget listen(Widget Function(T data, bool isLoading) customWidget) =>
      ValueListenableBuilder<T>(
        valueListenable: _dataListener,
        builder: (_, value, __) => customWidget.call(value, _isLoading),
      );

  void get updateWidget => _dataListener.notifyListeners();
}
