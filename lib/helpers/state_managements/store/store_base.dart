import 'package:flutter/material.dart';

abstract class StoreBase<T> extends ChangeNotifier {
  late ValueNotifier<T> _dataListener;
  StoreBase(T initialValue) {
    _dataListener = ValueNotifier<T>(initialValue);
  }

  bool _isLoading = false;

  get activateLoading {
    _isLoading = true;
    updateWidget;
  }

  get deactivateLoading {
    if (_isLoading) {
      _isLoading = false;
      updateWidget;
    }
  }

  T get data => _dataListener.value;
  set data(T value) => _dataListener.value = value;

  Widget listen(Widget Function(T data, bool isLoading) customWidget) =>
      ValueListenableBuilder<T>(
        valueListenable: _dataListener,
        builder: (_, value, __) => customWidget.call(value, _isLoading),
      );

  get updateWidget => _dataListener.notifyListeners();

  @override
  void dispose() {
    _dataListener.dispose();
    super.dispose();
  }
}
