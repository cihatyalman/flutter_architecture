import 'dart:async';

class Bloc<T> {
  late T _data;

  Bloc(T initialData) {
    _data = initialData;
  }

  var _streamController = StreamController<T>.broadcast();

  T get data => _data;
  set data(T data) {
    _data = data;
    updateWidget();
  }

  Stream<T> get stream => _streamController.stream;
  void updateWidget([T? data]) => _streamController.sink.add(data ?? _data);

  void init() {
    _streamController = StreamController<T>.broadcast();
  }

  Future<void> dispose() async {
    await _streamController.close();
  }
}
