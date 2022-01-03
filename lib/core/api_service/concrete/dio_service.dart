// ignore_for_file: avoid_print, unnecessary_overrides

import 'dart:convert';
import 'package:dio/dio.dart';
import '../abstract/i_api_service.dart';

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
      print("[C_ERROR]: $e");
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
      print("[C_ERROR]: $e");
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
      print("[C_ERROR]: $e");
      return null;
    }
  }
}

class _CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
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
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}