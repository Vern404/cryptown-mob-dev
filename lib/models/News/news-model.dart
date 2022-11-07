
import 'dart:convert';

class NewsListModel {
  NewsListModel({
    required this.news,
  });

  final List<News> news;

  factory NewsListModel.fromJson(String str) => NewsListModel.fromMap(json.decode(str));

  factory NewsListModel.fromMap(Map<String, dynamic> json) => NewsListModel(
    news: List<News>.from(json["news"].map((x) => News.fromMap(x))),
  );
}

class News {
  News({
    required this.name,
    required this.url,
    required this.description,
    required this.datePublished,
    required this.image,
  });

  final String name;
  final String url;
  final String description;
  final DateTime datePublished;
  final String image;

  factory News.fromJson(String str) => News.fromMap(json.decode(str));

  factory News.fromMap(Map<String, dynamic> json) => News(
    name: json["name"],
    url: json["url"],
    description: json["description"],
    datePublished: DateTime.parse(json["datePublished"]),
    image: json["image"] ?? 'not found',
  );
}
