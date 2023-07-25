import 'dart:convert';

class ParamsModel {
  int? pageSize;
  String? lastRecordId;

  ParamsModel({
    this.pageSize,
    this.lastRecordId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (pageSize != null) {
      result.addAll({'PageSize': pageSize});
    }
    if (lastRecordId != null) {
      result.addAll({'LastRecordId': lastRecordId});
    }

    return result;
  }

  String toJson() => json.encode(toMap());
}
