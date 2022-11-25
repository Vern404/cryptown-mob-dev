
import 'dart:convert';

class UpdateProfileModel {
  UpdateProfileModel({
    required this.email,
    required this.username,
  });

  final String email;
  final String username;

  factory UpdateProfileModel.fromJson(String str) => UpdateProfileModel.fromMap(json.decode(str));

  factory UpdateProfileModel.fromMap(Map<String, dynamic> json) => UpdateProfileModel(
    email: json["email"],
    username: json["username"],
  );
}
