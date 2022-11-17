import 'dart:convert';

import 'package:drc_cryptown/models/user/login-model.dart';
import 'package:http/http.dart' as http;

class UserSignInService {

  Future<UserSignIn> fetchUserSignInJWT(String email, String password) async {
    final Uri UserSignInUrl = Uri(
      scheme: 'https',
      host: 'api.cryptown-besquare.one',
      path: '/api/user/login',
    );
    print(UserSignInUrl);
    http.Response response = await http.post(
      UserSignInUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String,String>{
        'email': email,
        'password': password
      }),
    );


    if (response.statusCode == 200) {
      return UserSignIn.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 User Server Temporary Down. Please try again');
    }
  }
}

