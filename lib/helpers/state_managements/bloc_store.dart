// import 'bloc.dart';

import 'dart:ui';

import '../../models/local/user_model.dart';
import 'bloc/bloc_data.dart';

final blocStore = BlocStore();

class BlocStore {
  Size screenSize = Size.infinite;

  BlocData<UserModel>? _userBloc;
  BlocData<UserModel> get user => _userBloc ??= BlocData(UserModel());
}
