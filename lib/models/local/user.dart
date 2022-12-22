class User {
  String? username;
  int? age;

  User({
    this.username,
    this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'Username': username,
      'Age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['Username'],
      age: map['Age'],
    );
  }
}
