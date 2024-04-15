// import 'bloc.dart';

import 'dart:ui';

import '../../models/local/user.dart';
import 'bloc.dart';

final blocStore = BlocStore();

class BlocStore {
  Size screenSize = Size.infinite;

  Bloc<User>? _userBloc;
  Bloc<User> get user => _userBloc ??= Bloc<User>(User());
}
