import 'package:drc_cryptown/models/News/news-model.dart';
import 'package:http/http.dart' as http;

class NewsService {

  Future<NewsListModel> fetchNewsList() async {

    final Uri newsUrl = Uri(
      scheme: 'http',
      host: '192.168.100.52',
      port:5000,
      path: '/api/news',
    );

    http.Response response = await http.get(newsUrl);


    if (response.statusCode == 200) {
      return NewsListModel.fromJson(response.body);
    } else {
      throw Exception('ERROR 404 please try again');
    }
  }
}

