import 'dart:async';

import 'counter_repository.dart';
import 'counter_store.dart';

class CounterViewModel {
  final CounterRepository repo;
  CounterViewModel(this.repo);

  CounterStore get store => repo.store;

  Timer? _timer;

  Future<void> reset() => repo.reset();

  Future<void> increment() => repo.increment();
  Future<void> incrementLong([bool isRun = false]) async {
    if (isRun) {
      _timer = Timer.periodic(
        Duration(milliseconds: 100),
        (timer) => repo.increment(),
      );
    } else if (!isRun) {
      _timer?.cancel();
    }
  }

  Future<void> decrement() => repo.decrement();
  Future<void> decrementLong([bool isRun = false]) async {
    if (isRun) {
      _timer = Timer.periodic(
        Duration(milliseconds: 100),
        (timer) => repo.decrement(),
      );
    } else if (!isRun) {
      _timer?.cancel();
    }
  }
}
