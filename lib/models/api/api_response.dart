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
      result.addAll({'HasError': hasError});
    }
    if (message != null) {
      result.addAll({'Message': message});
    }
    if (validationErrors != null) {
      result.addAll({'ValidationErrors': validationErrors});
    }
    result.addAll({'Data': data});

    return result;
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      hasError: map['HasError'],
      message: map['Message'],
      validationErrors: map['ValidationErrors'],
      data: map['Data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source));
}
