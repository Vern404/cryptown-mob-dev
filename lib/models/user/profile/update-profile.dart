
import 'dart:convert';

class UpdateProfile {
  UpdateProfile({
    required this.email,
    required this.username,
  });

  final String email;
  final String username;

  factory UpdateProfile.fromJson(String str) => UpdateProfile.fromMap(json.decode(str));

  factory UpdateProfile.fromMap(Map<String, dynamic> json) => UpdateProfile(
    email: json["email"],
    username: json["username"],
  );
}
