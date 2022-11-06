import 'dart:convert';

class ApiResponse {
  bool? hasError;
  String? message;
  List? validationErrors;
  dynamic data;

  ApiResponse({
    this.hasError,
    this.message,
    this.validationErrors,
    this.data,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (hasError != null) {
      result.addAll({'hasError': hasError});
    }
    if (message != null) {
      result.addAll({'message': message});
    }
    if (validationErrors != null) {
      result.addAll({'validationErrors': validationErrors});
    }
    result.addAll({'data': data});

    return result;
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      hasError: map['hasError'],
      message: map['message'],
      validationErrors: map['validationErrors'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source));
}
