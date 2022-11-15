import 'package:drc_cryptown/models/Crypto/cryto-model.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({required this.cryptoListModel, Key? key}) : super(key: key);
  final CryptoListModel cryptoListModel ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: cryptoListModel.cryptoList.length,
          itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child:InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/crypto-details', arguments:cryptoListModel.cryptoList[index].cryptoId);
              },
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text('${cryptoListModel.cryptoList[index].marketCapRank}'),
                  Image.network(
                    '${cryptoListModel.cryptoList[index].image}',
                    height: 30,
                    width: 30,),
                  Text('${cryptoListModel.cryptoList[index].name}'),
                  Text('${cryptoListModel.cryptoList[index].symbol}'),
                  Text('${cryptoListModel.cryptoList[index].currentPrice}'),
                  IconButton(onPressed: (){
                    // Navigator.of(context).pushNamed('/crypto-details', arguments:cryptoListModel.cryptoList[index].cryptoId);
                  }, icon: Icon(Icons.star_border_outlined)),
                ]

              ),
            )
              );
            }
          )));
  }
}
