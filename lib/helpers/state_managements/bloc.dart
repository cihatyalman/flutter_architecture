import 'dart:async';

class Bloc<T> {
  var _streamController = StreamController<T>.broadcast();
  late T _data;

  T get data => _data;
  set data(T data) {
    _data = data;
    updateWidget();
  }

  Stream<T> get stream => _streamController.stream;
  void updateWidget([T? data]) => _streamController.sink.add(data ?? _data);

  void init() async {
    _streamController = StreamController<T>.broadcast();
  }

  Future<void> dispose() async {
    await _streamController.close();
  }

  Future<void> clean(T data) async {
    dispose();
    updateWidget(data);
  }
}
