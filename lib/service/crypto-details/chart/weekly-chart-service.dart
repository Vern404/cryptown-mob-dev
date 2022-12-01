
import 'package:drc_cryptown/models/Crypto/crypto-chart/weekly-chart.dart';
import 'package:http/http.dart' as http;

class WeeklyChartService {

  Future<WeeklyChart> fetchWeeklyChart(String cryptoId) async {

    final Uri WeeklyUrl = Uri(
      scheme: 'https',
      host: 'api.cryptown-besquare.one',
      path: '/api/crypto/cryptoChartWeekly/$cryptoId',
    );

    http.Response response = await http.get(
      WeeklyUrl,
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      // },
      // body: jsonEncode(<String,String>{
      //   'cryptoId': cryptoId
      // }),
    );


    if (response.statusCode == 200) {
      return WeeklyChart.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 please try again');
    }
  }
}

