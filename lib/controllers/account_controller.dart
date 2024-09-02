import '../core/api_service/i_api_service.dart';
import '../models/api/api_response.dart';

class AccountController {
  IApiService apiService;
  AccountController(this.apiService);

  // final _mainPath = "/Account";

  Future<ApiResponse> getMyProfile() async {
    // ...
    return ApiResponse.fromMap({}).checkData();
  }
}
