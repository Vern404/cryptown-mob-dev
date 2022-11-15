import 'package:drc_cryptown/models/Exchange-List/exchange-list-model.dart';
import 'package:http/http.dart' as http;

class ExchangeService {

  Future<ExchangeListModel> fetchExchangeList() async {

    final Uri exchangeUrl = Uri(
      scheme: 'https',
      host: 'api.cryptown-besquare.one',
      path: '/api/exchange',
    );

    http.Response response = await http.get(exchangeUrl);


    if (response.statusCode == 200) {
      return ExchangeListModel.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 please try again');
    }
  }
}

