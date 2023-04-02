// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';

class HomeViewModel {
  final _dataListener = ValueNotifier(0);
  Widget listenWidget(Widget Function(int data) customWidget) =>
      ValueListenableBuilder<int>(
        valueListenable: _dataListener,
        builder: (_, value, __) => customWidget.call(value),
      );
  void get updateWidget => _dataListener.notifyListeners();

  Future getData() async {
    _dataListener.value = 0;
  }

  Future add() async {}

  Future update() async {}

  Future delete(String id) async {
    _dataListener.value = 0;
  }

  Future increment() async {
    _dataListener.value += 1;
    // updateWidget;
  }

  Future decrement() async {
    _dataListener.value -= 1;
    // updateWidget;
  }
}
