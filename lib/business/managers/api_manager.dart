import '../../exports/export_business.dart' show AccountService, LoginService, TextConstants;
import '../../exports/export_core.dart';

final apiManager = ApiManager();

class ApiManager {
  final _apiService = DioService(TextConstants.baseUrl);

  LoginService? _loginService;
  LoginService get login => _loginService ??= LoginService(_apiService);

  AccountService? _accountService;
  AccountService get account => _accountService ??= AccountService(_apiService);
}
