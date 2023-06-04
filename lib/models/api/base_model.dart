import 'dart:convert';
import '../../core/utils/extensions.dart';

abstract class BaseModel {
  String? id;
  DateTime? createdDatetime;
  DateTime? updatedDatetime;

  BaseModel({
    this.id,
    this.createdDatetime,
    this.updatedDatetime,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'Id': id});
    }
    if (createdDatetime != null) {
      result.addAll({'CreatedDatetime': createdDatetime!.toISOStringUtc});
    }
    if (updatedDatetime != null) {
      result.addAll({'UpdatedDatetime': updatedDatetime!.toISOStringUtc});
    }

    return result;
  }

  // factory BaseModel.fromMap(Map<String, dynamic> map) {
  //   return BaseModel(
  //     id: map['Id'],
  //     createdDatetime: (map['CreatedDatetime'] as String?)?.toDateLocal,
  //     updatedDatetime: (map['UpdatedDatetime'] as String?)?.toDateLocal,
  //   );
  // }

  String toJson() => json.encode(toMap());

  // factory BaseModel.fromJson(String source) =>
  //     BaseModel.fromMap(json.decode(source));
}
