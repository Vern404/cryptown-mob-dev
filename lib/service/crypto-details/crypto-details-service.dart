import 'package:drc_cryptown/models/Crypto/crypto-details-model.dart';
import 'package:http/http.dart' as http;

class CryptoDetailsService {

  Future<CryptoDetailsModel> fetchCryptoDetails() async {
    // final HttpClient client = new HttpClient()
    //   ..badCertificateCallback=(X509Certificate cert,String host,int port)=>true;

    final Uri cryptoDetailsUrl = Uri(
      scheme: 'http',
      // host: '192.168.18.79',
      host: '192.168.100.52',
      port:5000,
      path: '/api/crypto/cryptoDetail',
    );

    http.Response response = await http.get(cryptoDetailsUrl);


    if (response.statusCode == 200) {
      return CryptoDetailsModel.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 please try again');
    }
  }
}

