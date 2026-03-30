import 'counter_store.dart';

class CounterRepository {
  static final CounterRepository instance = CounterRepository._internal();
  CounterRepository._internal();

  final _store = CounterStore.instance;
  CounterStore get store => _store;

  Future<void> reset() async {
    _store.counter.data = 0;
  }

  Future<void> increment() async {
    _store.counter.data += 1;
  }

  Future<void> decrement() async {
    _store.counter.data -= 1;
  }
}
