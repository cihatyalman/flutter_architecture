import '../constants/text_constants.dart';
import '../controllers/account_controller.dart';
import '../controllers/login_controller.dart';
import '../core/api_service/concrete/dio_service.dart';

ApiManager apiManager = ApiManager();

class ApiManager {
  late DioService _apiService;

  ApiManager({String? baseUrl}) {
    if (baseUrl != null) TextConstants.baseUrl = baseUrl;
    _apiService = DioService(TextConstants.baseUrl);
  }

  LoginController? _loginController;
  LoginController get login =>
      _loginController ??= LoginController(_apiService);

  AccountController? _accountController;
  AccountController get account =>
      _accountController ??= AccountController(_apiService);
}
