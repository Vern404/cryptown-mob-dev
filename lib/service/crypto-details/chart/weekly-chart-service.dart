import 'dart:convert';
import 'package:drc_cryptown/models/Crypto/crypto-chart/weekly-chart.dart';
import 'package:http/http.dart' as http;

class WeeklyChartService {

  Future<WeeklyChart> fetchWeeklyChart(String cryptoId) async {
    // final HttpClient client = new HttpClient()
    //   ..badCertificateCallback=(X509Certificate cert,String host,int port)=>true;

    final Uri WeeklyUrl = Uri(
      scheme: 'http',
      // host: '192.168.18.79',
      // host: '192.168.100.52',
      // port:5000,
      host: 'api.cryptown-besquare.one',
      path: '/api/crypto/cryptoChartWeekly',
    );

    http.Response response = await http.post(
      WeeklyUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String,String>{
        'cryptoId': cryptoId
      }),
    );


    if (response.statusCode == 200) {
      return WeeklyChart.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 please try again');
    }
  }
}

