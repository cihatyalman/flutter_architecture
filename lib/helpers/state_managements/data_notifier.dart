// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';

class DataNotifier<T> {
  late ValueNotifier<T> _dataListener;
  bool _isLoading = false;

  DataNotifier(T initialValue) {
    _dataListener = ValueNotifier<T>(initialValue);
  }

  T get value => _dataListener.value;
  set value(T value) => _dataListener.value = value;

  bool get isLoading => _isLoading;

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

  Widget listenWidget(Widget Function(T data, bool isLoading) customWidget) =>
      ValueListenableBuilder<T>(
        valueListenable: _dataListener,
        builder: (_, value, __) => customWidget.call(value, _isLoading),
      );

  // void get updateWidget => _dataListener.notifyListeners();
  void get updateWidget => WidgetsBinding.instance.addPostFrameCallback((_) {
        _dataListener.notifyListeners();
      });
}
