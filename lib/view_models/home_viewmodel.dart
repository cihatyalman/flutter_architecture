// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import '../helpers/state_managements/store/store_models.dart';

class HomeViewModel {
  final dataStore = StoreData<int>.create(0);

  Future getData() async {
    dataStore.data = 0;
  }

  Future add() async {}

  Future update() async {}

  Future delete(String id) async {
    dataStore.data = 0;
  }

  Future increment() async {
    dataStore.data += 1;
    // updateWidget;
  }

  Future decrement() async {
    dataStore.data -= 1;
    // updateWidget;
  }
}
