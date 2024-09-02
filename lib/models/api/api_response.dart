import 'dart:convert';

import '../../main.dart';
import '../../widgets/custom/custom_notify.dart';

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

extension ApiResponseExtension on ApiResponse? {
  /// 'Response' verisinin 'null' olup olmadığını kontrol eder, hata mesajlarını otomatik, onay mesajlarını isteğe bağlı olarak görüntüleyebilir.
  ApiResponse checkData({bool isOkeyNoti = false}) {
    if (this == null) {
      _showNoti(message: "Beklenmedik bir sorun oluştu.");
      return ApiResponse(hasError: true);
    } else if (this?.hasError == true && this?.message != "-") {
      _showNoti(message: this?.message);
      return this!;
    }
    if (isOkeyNoti) {
      _showNoti(message: this?.message, type: NotifyType.success);
    }
    return this!;
  }

  _showNoti({String? message, NotifyType type = NotifyType.error}) {
    Future.delayed(
      const Duration(milliseconds: 300),
      () => CustomNotify(message: message, type: type)
          .show(navigatorKey.currentContext!),
    );
  }
}
