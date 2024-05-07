import 'dart:convert';
import 'dart:typed_data';

class User {
  String name;
  String? gender;
  String email;
  String? level;
  String password;

  User({
    required this.name,
    this.gender,
    required this.email,
    this.level,
    required this.password,
  });

  @override
  String toString() {
    return 'User{name: $name, gender: $gender, email: $email,  level: $level, password: $password}';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      gender: json['gender'],
      email: json['email'],
      level: json['level'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'email': email,
      'level': level,
      'password': password,
    };
  }
}
