
import 'dart:convert';

class SearchResult {
  SearchResult({
    required this.searchList,
  });

  final List<SearchList> searchList;

  factory SearchResult.fromJson(String str) => SearchResult.fromMap(json.decode(str));

  factory SearchResult.fromMap(Map<String, dynamic> json) => SearchResult(
    searchList: List<SearchList>.from(json["searchList"].map((x) => SearchList.fromMap(x))),
  );
}

class SearchList {
  SearchList({
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

  factory SearchList.fromJson(String str) => SearchList.fromMap(json.decode(str));

  factory SearchList.fromMap(Map<String, dynamic> json) => SearchList(
    cryptoId: json["cryptoId"],
    symbol: json["symbol"],
    name: json["name"],
    currentPrice: json["current_price"].toDouble(),
    marketCap: json["market_cap"],
    marketCapRank: json["market_cap_rank"],
    image: json["image"],
  );

}
