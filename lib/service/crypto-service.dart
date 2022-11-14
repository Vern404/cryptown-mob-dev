import 'package:http/http.dart' as http;
import 'package:drc_cryptown/models/Crypto/cryto-model.dart';

class CryptoService {

  Future<CryptoListModel> fetchCryptoList() async {
    final Uri cryptoUrl = Uri(
      scheme: 'https',
      host: 'api.cryptown-besquare.one',
      path: '/api/crypto/cryptoList',
    );
    print(cryptoUrl);
    http.Response response = await http.get(cryptoUrl);


    if (response.statusCode == 200) {
      return CryptoListModel.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 please try again');
    }
  }
}

