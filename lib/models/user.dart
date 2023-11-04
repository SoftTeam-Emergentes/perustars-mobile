import 'dart:convert';

class User {
  String? username;
  String? password;

  User({this.username, this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
    );
  }
}

User userFromJson(String str) => User.fromJson(json.decode(str));
