import 'dart:convert';

class CryptoListModel {
  CryptoListModel({
    required this.cryptoList,
  });

  final List<CryptoList> cryptoList;

  factory CryptoListModel.fromJson(String str) => CryptoListModel.fromMap(json.decode(str));

  factory CryptoListModel.fromMap(Map<String, dynamic> json) => CryptoListModel(
    cryptoList: List<CryptoList>.from(json["cryptoList"].map((x) => CryptoList.fromMap(x))),
  );

}

class CryptoList {
  CryptoList({
    required this.cryptoId,
    required this.symbol,
    required this.name,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.image,
  });

  final String cryptoId;
  final String symbol;
  final String name;
  final double currentPrice;
  final int marketCap;
  final int marketCapRank;
  final String image;

  factory CryptoList.fromJson(String str) => CryptoList.fromMap(json.decode(str));

  factory CryptoList.fromMap(Map<String, dynamic> json) => CryptoList(
    cryptoId: json["cryptoId"],
    symbol: json["symbol"],
    name: json["name"],
    currentPrice: json["current_price"].toDouble(),
    marketCap: json["market_cap"],
    marketCapRank: json["market_cap_rank"],
    image: json["image"],
  );
}
