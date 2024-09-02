import 'dart:convert';
import '../../core/utils/extensions.dart';
import '../api/base_model.dart';

class UserModel extends BaseModel {
  String? username;
  int? age;

  UserModel({
    super.id,
    super.createdDatetime,
    super.updatedDatetime,
    this.username,
    this.age,
  });

  @override
  Map<String, dynamic> toMap() {
    final result = super.toMap();

    if (username != null) {
      result.addAll({'Username': username});
    }
    if (age != null) {
      result.addAll({'Age': age});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['Id'],
      createdDatetime: (map['CreatedDatetime'] as String?)?.toDateLocal,
      updatedDatetime: (map['UpdatedDatetime'] as String?)?.toDateLocal,
      username: map['Username'],
      age: map['Age']?.toInt(),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
