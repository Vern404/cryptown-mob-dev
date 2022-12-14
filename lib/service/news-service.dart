import 'package:drc_cryptown/models/News/news-model.dart';
import 'package:http/http.dart' as http;

class NewsService {

  Future<NewsListModel> fetchNewsList() async {

    final Uri newsUrl = Uri(
      scheme: 'https',
      host: 'api.cryptown-besquare.one',
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

