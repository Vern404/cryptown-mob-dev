import 'dart:convert';

class CryptoDetailsModel {
  CryptoDetailsModel({
    required this.cryptoDetails,
  });

  final CryptoDetails cryptoDetails;

  factory CryptoDetailsModel.fromJson(String str) => CryptoDetailsModel.fromMap(json.decode(str));

  factory CryptoDetailsModel.fromMap(Map<String, dynamic> json) => CryptoDetailsModel(
    cryptoDetails: CryptoDetails.fromMap(json["cryptoDetails"]),
  );

}

class CryptoDetails {
  CryptoDetails({
    required this.cryptoId,
    required this.symbol,
    required this.name,
    required this.marketCapRank,
    required this.currentPriceUsd,
    required this.currentPriceBtc,
    required this.currentPriceMyr,
    required this.marketCapUsd,
    required this.marketCapMyr,
    required this.totalSupply,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.ath,
    required this.atl,
    required this.link,
    required this.image,
    required this.exchange,
    required this.description,
  });

  final String cryptoId;
  final String symbol;
  final String name;
  final int marketCapRank;
  final double currentPriceUsd;
  final double currentPriceBtc;
  final double currentPriceMyr;
  final int marketCapUsd;
  final int marketCapMyr;
  final dynamic totalSupply;
  final dynamic maxSupply;
  final double circulatingSupply;
  final Ath ath;
  final Ath atl;
  final String link;
  final String image;
  final List<Exchange> exchange;
  final String description;

  factory CryptoDetails.fromJson(String str) => CryptoDetails.fromMap(json.decode(str));

  factory CryptoDetails.fromMap(Map<String, dynamic> json) => CryptoDetails(
    cryptoId: json["cryptoId"],
    symbol: json["symbol"],
    name: json["name"],
    marketCapRank: json["market_cap_rank"],
    currentPriceUsd: json["current_price_usd"].toDouble(),
    currentPriceBtc: json["current_price_btc"].toDouble(),
    currentPriceMyr: json["current_price_myr"].toDouble(),
    marketCapUsd: json["market_cap_usd"],
    marketCapMyr: json["market_cap_myr"],
    totalSupply: json["total_supply"] ?? '-',
    maxSupply: json["max_supply"] ?? '-',
    circulatingSupply: json["circulating_supply"].toDouble(),
    ath: Ath.fromMap(json["ath"]),
    atl: Ath.fromMap(json["atl"]),
    link: json["link"],
    image: json["image"],
    exchange: List<Exchange>.from(json["exchange"].map((x) => Exchange.fromMap(x))),
    description: json["description"] ?? 'not found',
  );
}

class Ath {
  Ath({
    required this.usd,
    required this.myr,
    required this.dateUsd,
    required this.changePercentageUsd,
    required this.changePercentageMyr,
  });

  final double usd;
  final double myr;
  final DateTime dateUsd;
  final double changePercentageUsd;
  final double changePercentageMyr;

  factory Ath.fromJson(String str) => Ath.fromMap(json.decode(str));

  factory Ath.fromMap(Map<String, dynamic> json) => Ath(
    usd: json["usd"].toDouble(),
    myr: json["myr"].toDouble(),
    dateUsd: DateTime.parse(json["date_usd"]),
    changePercentageUsd: json["change_percentage_usd"].toDouble(),
    changePercentageMyr: json["change_percentage_myr"].toDouble(),
  );
}

class Exchange {
  Exchange({
    required this.name,
    required this.tradeUrl,
  });

  final String name;
  final String tradeUrl;

  factory Exchange.fromJson(String str) => Exchange.fromMap(json.decode(str));

  factory Exchange.fromMap(Map<String, dynamic> json) => Exchange(
    name: json["name"],
    tradeUrl: json["trade_url"] ?? '',
  );

}
