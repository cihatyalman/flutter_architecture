import 'package:flutter_architecture/business/services/account_service.dart';
import 'package:flutter_architecture/business/services/login_service.dart';

import '../../exports/export_core.dart';
import '../../exports/export_business.dart';

final apiManager = ApiManager();

class ApiManager {
  final IApiService apiService = DioService(TextConstants.baseUrl);

  LoginService? _loginService;
  LoginService get login => _loginService ??= LoginService(apiService);

  AccountService? _accountService;
  AccountService get account => _accountService ??= AccountService(apiService);
}
