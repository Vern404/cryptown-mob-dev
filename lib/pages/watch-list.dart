
import 'package:drc_cryptown/widgets/global-widget/nav-bar.dart';
import 'package:drc_cryptown/widgets/watch-list.dart';
import 'package:flutter/material.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(152, 203, 255, 1.0),
        centerTitle: true,
        title:Image.asset('assets/image/logo.png',fit: BoxFit.fitWidth,width: 150,),
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
          Container(
            child: Text(
              'Watchlist',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(68, 140, 249, 1.0),
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            width: size.width,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    Text('Favourite Coin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),),
                  ],
                ),
            ),
            const SizedBox(height: 10),
            Expanded(child: WatchList()),
          ]
        )
      )
    );
  }
}
