class User {
  String name;
  String? gender;
  String email;
  int? level;
  String password;
  String confirmPassword;

  User({
    required this.name,
    this.gender,
    required this.email,
    this.level,
    required this.password,
    required this.confirmPassword,
  });

  @override
  String toString() {
    return 'User{name: $name, gender: $gender, email: $email,  level: $level, password: $password, confirmPassword: $confirmPassword}';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      gender: json['gender'],
      email: json['email'],
      level: json['level'],
      password: json['password'],
      confirmPassword: json['confirm_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'email': email,
      'level': level,
      'password': password,
      "confirm_password": confirmPassword
    };
  }
}
