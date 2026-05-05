import 'dart:convert';

class ParamsModel {
  int? pageSize;
  dynamic lastRecordValue;

  ParamsModel({this.pageSize, this.lastRecordValue});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (pageSize != null) {
      result.addAll({'page-size': pageSize});
    }
    if (lastRecordValue != null) {
      result.addAll({'last-record-value': lastRecordValue});
    }

    return result;
  }

  String toJson() => json.encode(toMap());
}
