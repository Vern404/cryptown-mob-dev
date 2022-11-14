import 'dart:convert';

import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';
import 'package:http/http.dart' as http;

class DailyChartService {

  Future<DailyChart> fetchDailyChart(String cryptoId) async {
    // final HttpClient client = new HttpClient()
    //   ..badCertificateCallback=(X509Certificate cert,String host,int port)=>true;

    final Uri DailyUrl = Uri(
      scheme: 'https',
      host: 'api.cryptown-besquare.one',
      path: '/api/crypto/cryptoChartDaily',
    );

    http.Response response = await http.post(
      DailyUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String,String>{
        'cryptoId': cryptoId
      }),
    );


    if (response.statusCode == 200) {
      return DailyChart.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 please try again');
    }
  }
}

