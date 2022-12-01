
import 'package:drc_cryptown/models/watchlist/watchlist-model.dart';
import 'package:drc_cryptown/service/watchlist-service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {

final WatchlistService watchlistService = WatchlistService();
late String accesstoken;

Future<Map<String, dynamic>> getWatchlist() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  accesstoken = _prefs.getString("userJwt")!;
  dynamic Res;
  Res = await watchlistService.getUserFavouriteList('$accesstoken');
  return Res;
}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
        width: size.width,
        height: size.height,
        child: FutureBuilder<Map<String, dynamic>>(
        future: getWatchlist(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
           if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
              height: size.height,
              width: size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

           //get json response body data into list
           var watchlist = snapshot.data!["favourites"];
           List<Favourite> favourite = List.castFrom(watchlist.map((e) => Favourite.fromMap(e)).toList());

           if (favourite.isEmpty){
             return Container(
               alignment: Alignment.topCenter,
               padding: EdgeInsets.all(20),
               child: Text('No crypto added into Watchlist',
                 style: TextStyle(
                   color: Colors.white60,
                   fontSize: 24,
                   fontWeight: FontWeight.w400,
                 ) ,),
             );
           } else{
             return ListView.builder(
                 itemCount: favourite.length,
                 itemBuilder: (context, index) {
                   return Card(
                       color: Color.fromRGBO(127, 156, 200, 1.0),
                       child: Container(
                         padding: EdgeInsets.symmetric(horizontal: 15),
                         child:InkWell(
                           onTap: (){
                             Navigator.of(context).pushNamed(
                                 '/crypto-details',
                                 arguments:favourite[index].cryptoid);
                           },
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisSize: MainAxisSize.min,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     Text(favourite[index].coinname,
                                       style: TextStyle(
                                         fontSize: 14,
                                         fontWeight: FontWeight.bold,
                                       ) ,),
                                     const SizedBox(width: 10),
                                     Image.network(favourite[index].imageUrl,height: 40,),
                                   ],
                                 ),
                                 ElevatedButton(
                                     onPressed: (){
                                       setState(() async {
                                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                           content: const Text('Removing coin from WatchList'),
                                           backgroundColor: Colors.green.shade300,
                                         ));
                                         Map<String, dynamic> favCoinData = {
                                           'favId' : favourite[index].favid,
                                         };

                                         dynamic res = await watchlistService.deleteWatchListCoin(accessToken: accesstoken,data: favCoinData);

                                         if (res['deletedFavId'] != null) {
                                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                             content: const Text('Removed from Watchlist'),
                                             backgroundColor: Colors.green.shade300,
                                           ));
                                           Navigator.of(context).pushNamed('/watch-list');
                                         } else {
                                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                             content: Text('Error: ${res['mssg']}'),
                                             backgroundColor: Colors.red.shade300,
                                           ));
                                         }
                                       });
                                     },
                                     child: Text(
                                         'remove'
                                     ))
                               ],
                             ),
                           ),
                         ),
                       )
                   );
                 }
             );
           }
          }
          else {
            debugPrint(snapshot.error.toString());
          }
          return const SizedBox();
        }),
      )
    );

  }
}
