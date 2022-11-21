import 'dart:convert';
import 'dart:io';
import 'package:drc_cryptown/models/user/profile/view-profile.dart';
import 'package:http/http.dart';

class UserService {

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      final Uri registerUrl = Uri(
        scheme: 'http',
        // host: 'api.cryptown-besquare.one',
        host: '192.168.18.79',
        port: 5000,
        path: '/api/user/signup',
      );
      Response response = await post(
        // 'https://api.cryptown-besquare.one/api/user/signup',
        //   Uri.parse('http://192.168.18.79:5000/api/user/signup'),
        registerUrl,
          body: data,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
      );
      switch (response.statusCode) {
        case 200:
          return response.body;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }

  Future<dynamic> login(Map<String, dynamic>? data) async {
    try {
      final Uri loginUrl = Uri(
        scheme: 'http',
        // host: 'api.cryptown-besquare.one',
        host: '192.168.18.79',
        port: 5000,
        path: '/api/user/login',
      );
      Response response = await post(
        // // 'https://api.cryptown-besquare.one/api/user/signup',
        // Uri.parse('http://192.168.18.79:5000/api/user/login'),
        loginUrl,
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      switch (response.statusCode) {
        case 200:
          // final data = json.decode(response.body);
          // return UserSignIn.fromMap(data);
          return response.body;
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
      Response response = await get(
        // 'http://192.168.18.61:5000/api/user/profile',
        Uri.parse('http://192.168.18.79:5000/api/user/profile'),
        headers: {
          'Authorization': 'Bearer $accessToken'
        },
      );
      
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return ViewProfile.fromMap(data);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
//
// Future<dynamic> updateUserProfile({
//   required String accessToken,
//   required Map<String, dynamic> data,
// }) async {
//   try {
//     Response response = await _dio.put(
//       'https://api.cryptown-besquare.one/api/user/update',
//       data: data,
//       queryParameters: {'apikey': ApiSecret.apiKey},
//       options: Options(
//         headers: {'Authorization': 'Bearer $accessToken'},
//       ),
//     );
//     return response.data;
//   } on DioError catch (e) {
//     return e.response!.data;
//   }
// }

}