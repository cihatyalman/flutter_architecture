import '../../exports/export_business.dart';
import '../../exports/export_core.dart';

final apiManager = ApiManager();

class ApiManager {
  final _apiService = DioService(TextConstants.baseUrl);

  LoginController? _loginController;
  LoginController get login =>
      _loginController ??= LoginController(_apiService);

  AccountController? _accountController;
  AccountController get account =>
      _accountController ??= AccountController(_apiService);
}
