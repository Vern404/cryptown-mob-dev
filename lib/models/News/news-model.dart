import 'dart:convert';

class NewsListModel {
  NewsListModel({
    required this.newsList,
    required this.errorMessage,
  });

  final List<NewsList> newsList;
  final dynamic errorMessage;

  factory NewsListModel.fromJson(String str) => NewsListModel.fromMap(json.decode(str));

  factory NewsListModel.fromMap(Map<String, dynamic> json) => NewsListModel(
    newsList: List<NewsList>.from(json["newsList"].map((x) => NewsList.fromMap(x))),
    errorMessage: json["errorMessage"],
  );
}

class NewsList {
  NewsList({
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

  factory NewsList.fromJson(String str) => NewsList.fromMap(json.decode(str));

  factory NewsList.fromMap(Map<String, dynamic> json) => NewsList(
    name: json["name"],
    url: json["url"],
    description: json["description"],
    datePublished: DateTime.parse(json["datePublished"]),
    image: json["image"] ?? 'Not Found',
  );

}
