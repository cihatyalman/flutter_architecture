import '../core/api_service/abstract/i_api_service.dart';

class LoginController {
  IApiService apiService;
  LoginController(this.apiService);

  final mainPath = "/Login";

  Future register() async {}

  Future login() async {}
}
