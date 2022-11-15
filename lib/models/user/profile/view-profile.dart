
import 'dart:convert';

class ViewProfile {
  ViewProfile({
    required this.email,
    required this.username,
  });

  final String email;
  final String username;

  factory ViewProfile.fromJson(String str) => ViewProfile.fromMap(json.decode(str));

  factory ViewProfile.fromMap(Map<String, dynamic> json) => ViewProfile(
    email: json["email"],
    username: json["username"],
  );
}
