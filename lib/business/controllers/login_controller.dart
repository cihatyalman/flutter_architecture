import '../../core/api_service/abstract/i_api_service.dart';

class LoginController {
  IApiService apiService;
  LoginController(this.apiService);

  Future signIn() async {}

  Future signOut() async {}
}
