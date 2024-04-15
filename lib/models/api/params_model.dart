import 'dart:convert';

class ParamsModel {
  int? pageSize;
  dynamic lastRecordValue;

  ParamsModel({
    this.pageSize,
    this.lastRecordValue,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (pageSize != null) {
      result.addAll({'PageSize': pageSize});
    }
    if (lastRecordValue != null) {
      result.addAll({'LastRecordValue': lastRecordValue});
    }

    return result;
  }

  String toJson() => json.encode(toMap());
}
