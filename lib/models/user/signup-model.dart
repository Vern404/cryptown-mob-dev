import 'dart:convert';

class UserSignUp {
  UserSignUp({
    required this.email,
    required this.username,
    required this.userJwt,
  });

  final String email;
  final String username;
  final String userJwt;

  factory UserSignUp.fromJson(String str) => UserSignUp.fromMap(json.decode(str));

  factory UserSignUp.fromMap(Map<String, dynamic> json) => UserSignUp(
    email: json["email"],
    username: json["username"],
    userJwt: json["userJwt"],
  );

}
