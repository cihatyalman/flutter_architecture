// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import '../helpers/state_managements/data_notifier.dart';

class HomeViewModel {
  DataNotifier<int>? _dataNotifier;
  DataNotifier<int> get dataNotifier => _dataNotifier ??= DataNotifier<int>(0);

  Future getData() async {
    dataNotifier.value = 0;
  }

  Future add() async {}

  Future update() async {}

  Future delete(String id) async {
    dataNotifier.value = 0;
  }

  Future increment() async {
    dataNotifier.value += 1;
    // updateWidget;
  }

  Future decrement() async {
    dataNotifier.value -= 1;
    // updateWidget;
  }
}
