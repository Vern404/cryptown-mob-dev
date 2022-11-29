import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart';

class ForumService {

  Future<dynamic> getForum(String accessToken) async {
    try {
      final Uri viewAllPost = Uri(
        scheme: 'https',
        host: 'api.cryptown-besquare.one',
        path: '/api/post/getPosts',
      );
      Response response = await get(
        viewAllPost,
        headers: {
          'Authorization': 'Bearer $accessToken'
        },
      );
      // print(response.body);
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

  Future<dynamic> addPost({
    required String accessToken,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Uri addPost = Uri(
        scheme: 'https',
        host: 'api.cryptown-besquare.one',
        path: '/api/post/addPost',
      );
      Response response = await post(
        addPost,
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


  Future<dynamic> deletePost({
    required String accessToken,
    required Map<String, dynamic> data})
  async {
    try {
      final Uri deletePost = Uri(
        scheme: 'https',
        host: 'api.cryptown-besquare.one',
        path: '/api/post/post-delete',
      );
      Response response = await delete(
        deletePost,
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
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
}