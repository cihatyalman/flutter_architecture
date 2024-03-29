import 'dart:convert';

class ApiResponse {
  bool hasError;
  String? message;
  Map validationErrors;
  dynamic data;

  ApiResponse({
    this.hasError = false,
    this.message,
    this.validationErrors = const {},
    this.data,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'HasError': hasError});
    if (message != null) {
      result.addAll({'Message': message});
    }
    result.addAll({'ValidationErrors': validationErrors});

    result.addAll({'Data': data});

    return result;
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      hasError: map['HasError'] ?? false,
      message: map['Message'],
      validationErrors: map['ValidationErrors'],
      data: map['Data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source));

  String? getValid(String key) {
    return validationErrors[key];
  }
}
