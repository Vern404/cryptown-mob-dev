
import 'package:drc_cryptown/models/Crypto/crypto-details-model.dart';
import 'package:http/http.dart' as http;

class CryptoDetailsService {

  Future<CryptoDetailsModel> fetchCryptoDetailsByCryptoId(String cryptoId) async {
    final Uri cryptoDetailsUrl = Uri(
      scheme: 'https',
      host: 'api.cryptown-besquare.one',
      path: '/api/crypto/cryptoDetail/$cryptoId',
    );

    http.Response response = await http.get(
      cryptoDetailsUrl,
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      // },
      // body: jsonEncode(<String,String>{
      //   'cryptoId': cryptoId
      // }),
    );

    if (response.statusCode == 200) {
      return CryptoDetailsModel.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 please try again');
    }
  }
}

