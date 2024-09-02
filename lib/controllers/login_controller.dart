import '../core/api_service/i_api_service.dart';
import '../models/api/api_response.dart';

class LoginController {
  IApiService apiService;
  LoginController(this.apiService);

  // final _mainPath = "/Login";

  Future<ApiResponse> register(Map<String, dynamic> json) async {
    // ...
    return ApiResponse.fromMap({}).checkData();
  }

  Future<ApiResponse> login(Map<String, dynamic> json) async {
    // ...
    return ApiResponse.fromMap({}).checkData();
  }
}
