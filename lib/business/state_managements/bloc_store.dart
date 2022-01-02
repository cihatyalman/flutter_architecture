import '../../exports/export_bloc.dart';

final blocStore = BlocStore();

class BlocStore{
  UserBloc? _userBloc;
  UserBloc get user => _userBloc ??= UserBloc();

}