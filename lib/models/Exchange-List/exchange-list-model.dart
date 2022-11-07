import 'dart:convert';

class ExchangeListModel {
  ExchangeListModel({
    required this.exchange,
  });

  final List<Exchange> exchange;

  factory ExchangeListModel.fromJson(String str) => ExchangeListModel.fromMap(json.decode(str));

  factory ExchangeListModel.fromMap(Map<String, dynamic> json) => ExchangeListModel(
    exchange: List<Exchange>.from(json["exchange"].map((x) => Exchange.fromMap(x))),
  );
}

class Exchange {
  Exchange({
    required this.name,
    required this.yearEstablished,
    required this.country,
    required this.trustScoreRank,
    required this.trustScore,
    required this.tradeVolume24HBtc,
    required this.url,
    required this.image,
  });

  final String name;
  final String yearEstablished;
  final String? country;
  final int trustScoreRank;
  final int trustScore;
  final double tradeVolume24HBtc;
  final String url;
  final String image;

  factory Exchange.fromJson(String str) => Exchange.fromMap(json.decode(str));

  factory Exchange.fromMap(Map<String, dynamic> json) => Exchange(
    name: json["name"],
    yearEstablished: json["year_established"].toString(),
    country: json["country"] ?? 'null',
    trustScoreRank: json["trust_score_rank"],
    trustScore: json["trust_score"],
    tradeVolume24HBtc: json["trade_volume_24h_btc"].toDouble(),
    url: json["url"],
    image: json["image"],
  );
}
