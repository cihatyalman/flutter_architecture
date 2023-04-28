import '../../models/local/user.dart';
import 'bloc.dart';

final blocStore = BlocStore();

class BlocStore {
  Bloc<User>? _userBloc;
  Bloc<User> get user => _userBloc ??= Bloc<User>(User());
}
