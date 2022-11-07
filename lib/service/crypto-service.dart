import 'package:http/http.dart' as http;
import 'package:drc_cryptown/models/Crypto/cryto-model.dart';

class CryptoService {

  Future<CryptoListModel> fetchCryptoList() async {
    // final HttpClient client = new HttpClient()
    //   ..badCertificateCallback=(X509Certificate cert,String host,int port)=>true;

    final Uri cryptoUrl = Uri(
      scheme: 'http',
      host: '192.168.18.79',
      // host: '192.168.100.52',
      port:5000,
      path: '/api/crypto/cryptoList',
    );

    http.Response response = await http.get(cryptoUrl);


    if (response.statusCode == 200) {
      return CryptoListModel.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 please try again');
    }
  }
}

