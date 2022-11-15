import 'dart:convert';

class UserLogin {
  UserLogin({
    required this.email,
    required this.userJwt,
  });

  final String email;
  final String userJwt;

  factory UserLogin.fromJson(String str) => UserLogin.fromMap(json.decode(str));

  factory UserLogin.fromMap(Map<String, dynamic> json) => UserLogin(
    email: json["email"],
    userJwt: json["userJwt"],
  );
}
