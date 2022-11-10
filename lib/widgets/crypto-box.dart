import 'package:drc_cryptown/models/Crypto/cryto-model.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({required this.cryptoListModel, Key? key}) : super(key: key);
  final CryptoListModel cryptoListModel ;

  @override
  Widget build(BuildContext context) {
    // final rgx = RegExp(r'[\D+]');
    // final String cryptoId = rgx.firstMatch(cryptoListModel.cryptoList) ?? 'bitcoin';
    // final String cryptoId = rgx.firstMatch(cryptoListModel.cryptoList);

    // final String cryptoId = 'bitcoin';
    return Card(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cryptoListModel.cryptoList.length,
                itemBuilder: (context, index) {
                return Row(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          Text('${cryptoListModel.cryptoList[index].marketCapRank}'),
                          Image.network('${cryptoListModel.cryptoList[index].image}',height: 30,width: 30,),
                          Text('${cryptoListModel.cryptoList[index].name}'),
                          Text('${cryptoListModel.cryptoList[index].symbol}'),
                          Text('${cryptoListModel.cryptoList[index].currentPrice}'),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushNamed('/crypto-details', arguments:cryptoListModel.cryptoList[index].cryptoId);
                          }, icon: Icon(Icons.navigate_next_rounded)),
                        ]
                      )
                    ], );
                  }
                )
            ),
          ]

      ),
    );
}
}
