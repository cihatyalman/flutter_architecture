import '../core/api_service/abstract/i_api_service.dart';

class AccountController {
  IApiService apiService;
  AccountController(this.apiService);

  final mainPath = "/Account";

  Future getAccount() async {}
}
