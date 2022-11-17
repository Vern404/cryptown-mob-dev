import 'dart:convert';

class UserSignIn {
  UserSignIn({
    required this.user,
    required this.email,
    required this.userJwt,
  });

  final String user;
  final String email;
  final String userJwt;

  factory UserSignIn.fromJson(String str) => UserSignIn.fromMap(json.decode(str));

  factory UserSignIn.fromMap(Map<String, dynamic> json) => UserSignIn(
    user: json["user"],
    email: json["email"],
    userJwt: json["userJwt"],
  );
}
