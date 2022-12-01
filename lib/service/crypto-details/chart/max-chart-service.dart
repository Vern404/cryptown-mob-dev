
import 'package:drc_cryptown/models/Crypto/crypto-chart/max-chart.dart';
import 'package:http/http.dart' as http;

class MaxChartService {

  Future<MaxChart> fetchMaxChart(String cryptoId) async {

    final Uri MaxUrl = Uri(
      scheme: 'https',
      host: 'api.cryptown-besquare.one',
      path: '/api/crypto/cryptoChartMax/$cryptoId',
    );

    http.Response response = await http.get(
      MaxUrl,
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      // },
      // body: jsonEncode(<String,String>{
      //   'cryptoId': cryptoId
      // }),
    );


    if (response.statusCode == 200) {
      return MaxChart.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 please try again');
    }
  }
}

