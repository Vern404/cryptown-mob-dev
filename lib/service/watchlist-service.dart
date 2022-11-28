import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart';

class WatchlistService {

  Future<dynamic> getUserFavouriteList(String accessToken) async {
    try {
      final Uri viewWatchList = Uri(
        scheme: 'http',
        // host: 'api.cryptown-besquare.one',
        // host: '192.168.18.79',
        host: '192.168.100.52 ',
        port: 5000,
        path: '/api/favourite/favourite-list',
      );
      Response response = await get(
        viewWatchList,
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

  Future<dynamic> updateWatchListCoin({
    required String accessToken,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Uri updateWatchlistUrl = Uri(
        scheme: 'http',
        // host: 'api.cryptown-besquare.one',
        host: '192.168.18.79',
        port: 5000,
        path: '/api/favourite/favourite-add',
      );
      Response response = await post(
        updateWatchlistUrl,
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


  Future<dynamic> deleteWatchListCoin({
    required String accessToken,
    required Map<String, dynamic> data})
  async {
    try {
      final Uri deleteCoinUrl = Uri(
        scheme: 'http',
        // host: 'api.cryptown-besquare.one',
        host: '192.168.18.79',
        port: 5000,
        path: '/api/favourite/favourite-delete',
      );
      Response response = await delete(
        deleteCoinUrl,
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