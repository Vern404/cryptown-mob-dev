import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart';

class UserService {

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      final Uri registerUrl = Uri(
        scheme: 'https',
        host: 'api.cryptown-besquare.one',
        path: '/api/user/signup',
      );
      Response response = await post(
        registerUrl,
        body: jsonEncode(data),
        headers: <String, String>{
         'Content-Type': 'application/json',
        },
      );
      switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body);
          return data;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (error) {
      // rethrow;
      throw Exception(error);
    }
  }

  Future<dynamic> login(Map<String, dynamic>? data) async {
    try {
      final Uri loginUrl = Uri(
        scheme: 'https',
        host: 'api.cryptown-besquare.one',
        path: '/api/user/login',
      );
      Response response = await post(
        loginUrl,
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      
      switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body);
          return data;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (error) {
      // rethrow;
      throw Exception(error);
    }
  }

  Future<dynamic> getUserProfileData(String accessToken) async {
    try {
      final Uri viewProfileUrl = Uri(
        scheme: 'https',
        host: 'api.cryptown-besquare.one',
        path: '/api/user/profile',
      );
      Response response = await get(
        viewProfileUrl,
        headers: {
          'Authorization': 'Bearer $accessToken'
        },
      );
      
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return data;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (error){
      throw Exception(error);
    }
  }

  Future<dynamic> updateUserProfile({
    required String accessToken,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Uri updateProfileUrl = Uri(
        scheme: 'https',
        host: 'api.cryptown-besquare.one',
        path: '/api/user/update',
      );
      Response response = await patch(
        updateProfileUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return data;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (error) {
      // rethrow;
      throw Exception(error);
    }
  }

  Future<dynamic> logout(String accessToken) async {
    try {
      final Uri logoutUrl = Uri(
        scheme: 'https',
        host: 'api.cryptown-besquare.one',
        path: '/api/user/logout',
      );
      Response response = await delete(
        logoutUrl,
        headers: {
          'Authorization': 'Bearer $accessToken'
        },
      );

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return data;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (error){
      throw Exception(error);
    }
  }
}