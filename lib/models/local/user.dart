import 'dart:convert';
import '../../core/utils/extensions.dart';
import '../api/base_model.dart';

class User extends BaseModel {
  String? username;
  int? age;

  User({
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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['Id'],
      createdDatetime: (map['CreatedDatetime'] as String?)?.toDateLocal,
      updatedDatetime: (map['UpdatedDatetime'] as String?)?.toDateLocal,
      username: map['Username'],
      age: map['Age']?.toInt(),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
