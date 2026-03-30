import '../../services/state_tools/store/exports.dart';

class CounterStore {
  static final CounterStore instance = CounterStore._internal();
  CounterStore._internal();

  final counter = StoreData.create(0);
}
