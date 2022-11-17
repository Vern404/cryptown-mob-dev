import 'dart:convert';
import 'dart:io';
import 'package:drc_cryptown/models/user/signup-model.dart';
import 'package:http/http.dart' as http;

class UserSignUpService {

  Future<UserSignUp> fetchUserSignUpJWT(String email, String username,
      String password, String confirmPassword) async {
    // final Uri UserSignUpUrl = Uri(
    //   scheme: 'https',
    //   host: 'api.cryptown-besquare.one',
    //   path: '/api/user/signup',
    // );
    // print(UserSignUpUrl);
    // http.Response response = await http.post(
    //   UserSignUpUrl,
    //   headers: <String, String>{
    //     'Content-Type': 'application/json',
    //   },
    //   body: jsonEncode(<String,String>{
    //     'email': email,
    //     'username': username,
    //     'password': password,
    //     'confirm_password' : confirmPassword,
    //   }),
    // );
    //
    //
    // if (response.statusCode == 200) {
    //   return UserSignUp.fromJson(response.body);
    // } else {
    //   return Error(Exception(response.reasonPhrase));
    //   throw Exception('ERROR 404 User Sign Up Server Temporary Down. Please try again');
    // }
    // }
    try {
      final Uri UserSignUpUrl = Uri(
        scheme: 'https',
        host: 'api.cryptown-besquare.one',
        path: '/api/user/signup',
      );
      http.Response response = await http.post(UserSignUpUrl,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'username': username,
          'password': password,
          'confirm_password': confirmPassword,
        }),
      );
      switch (response.statusCode) {
        case 200:
          return UserSignUp.fromJson(response.body);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
