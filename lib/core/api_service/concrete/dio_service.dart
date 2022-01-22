import 'dart:convert';
import 'package:dio/dio.dart';
import '../abstract/i_api_service.dart';
import '../../utilities/console.dart';

class DioService implements IApiService {
  final String baseUrl;
  final Map<String, dynamic>? headers;

  final dio = Dio();

  DioService(
    this.baseUrl, {
    this.headers,
  }) {
    dio
      ..options.baseUrl = baseUrl
      ..interceptors.add(_CustomInterceptors());
  }

  @override
  Future get({
    required String path,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await dio.get(
        path,
        options: Options(headers: headers ?? this.headers),
      );
      return jsonDecode(response.toString());
    } catch (e) {
      Console.printError(e.toString());
      return null;
    }
  }

  @override
  Future post({
    required String path,
    required Map<String, dynamic> json,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await dio.post(
        path,
        options: Options(headers: headers ?? this.headers),
        data: jsonEncode(json),
      );
      return jsonDecode(response.toString());
    } catch (e) {
      Console.printError(e.toString());
      return null;
    }
  }

  @override
  Future? postFormData({
    required String path,
    required Map<String, dynamic> json,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await dio.post(
        path,
        options: Options(headers: headers ?? this.headers),
        data: FormData.fromMap(json),
      );
      return response.toString();
    } catch (e) {
      Console.printError(e.toString());
      return null;
    }
  }
}

class _CustomInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    // print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // print(
    //   'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    // );
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    Console.printError(
        "StatusCode: ${err.response?.statusCode} => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}
