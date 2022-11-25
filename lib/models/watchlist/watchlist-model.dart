
import 'dart:convert';

class WatchlistModel {
  WatchlistModel({
    required this.mssg,
    required this.favourites,
  });

  final String mssg;
  final List<Favourite> favourites;

  factory WatchlistModel.fromJson(String str) => WatchlistModel.fromMap(json.decode(str));

  factory WatchlistModel.fromMap(Map<String, dynamic> json) => WatchlistModel(
    mssg: json["mssg"],
    favourites: List<Favourite>.from(json["favourites"].map((x) => Favourite.fromMap(x))),
  );
}

class Favourite {
  Favourite({
    required this.favid,
    required this.coinname,
    required this.imageUrl,
    required this.cryptoid,
  });

  final String favid;
  final String coinname;
  final String imageUrl;
  final String cryptoid;

  factory Favourite.fromJson(String str) => Favourite.fromMap(json.decode(str));

  factory Favourite.fromMap(Map<String, dynamic> json) => Favourite(
    favid: json["favid"],
    coinname: json["coinname"],
    imageUrl: json["image_url"],
    cryptoid: json["cryptoid"],
  );

}
