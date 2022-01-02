import 'dart:async';
import '../../../exports/export_models.dart';

class UserBloc {
  final _streamController = StreamController<User>.broadcast();
  User _data = User();

  User get data => _data;
  set data(User data) {
    _data = data;
    updateWidget();
  }

  Stream<User> get stream => _streamController.stream;
  void updateWidget() => _streamController.sink.add(_data);

  Future dispose() async {
    await _streamController.close();
  }

  clean() {
    _data = User();
  }
}
