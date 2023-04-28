import 'dart:convert';

class ApiResponse2 {
  bool hasError;
  String? message;
  List? validationErrors;
  dynamic data;

  ApiResponse2({
    this.hasError = false,
    this.message,
    this.validationErrors,
    this.data,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'HasError': hasError});
    if (message != null) {
      result.addAll({'Message': message});
    }
    if (validationErrors != null) {
      result.addAll({'ValidationErrors': validationErrors});
    }
    result.addAll({'Data': data});

    return result;
  }

  factory ApiResponse2.fromMap(Map<String, dynamic> map) {
    return ApiResponse2(
      hasError: map['HasError'] ?? false,
      message: map['Message'],
      validationErrors: map['ValidationErrors'],
      data: map['Data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse2.fromJson(String source) =>
      ApiResponse2.fromMap(json.decode(source));

  String? getValid(String key) {
    return validationErrors?.firstWhere(
      (e) => e.values.contains(key),
      orElse: () => {"Value": null},
    )["Value"];
  }
}
