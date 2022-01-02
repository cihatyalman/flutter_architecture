import '../../exports/export_core.dart';
import '../../exports/export_business.dart';

final apiManager = ApiManager(DioService(TextConstants.baseUrl));

class ApiManager implements IApiService<String> {
  final IApiService apiService;
  ApiManager(this.apiService);

  @override
  Future<String?> get({
    required String path,
    Map<String, String>? headers,
  }) async {
    final response = await apiService.get(
      path: path,
      headers: headers,
    );
    return response.toString();
  }

  @override
  Future<String?> post({
    required String path,
    required Map<String, dynamic> json,
    Map<String, String>? headers,
  }) async {
    final response = await apiService.post(
      path: path,
      json: json,
      headers: headers,
    );
    return response.toString();
  }

  @override
  Future<String?> postFormData({
    required String path,
    required Map<String, dynamic> json,
    Map<String, String>? headers,
  }) async {
    final response = await apiService.postFormData(
      path: path,
      json: json,
      headers: headers,
    );
    return response.toString();
  }
}
