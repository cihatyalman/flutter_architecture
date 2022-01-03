import '../../core/api_service/abstract/i_api_service.dart';

class LoginService {
  IApiService apiService;
  LoginService(this.apiService);

  Future signIn() async {}

  Future signOut() async {}
}
