import 'package:drc_cryptown/models/cryto-model.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({required this.cryptoListModel, Key? key}) : super(key: key);
  final CryptoListModel cryptoListModel ;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cryptoListModel.cryptoList.length,
              itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(width: 0.1,),
                    Text('${cryptoListModel.cryptoList[index].marketCapRank}'),
                    Image.network('${cryptoListModel.cryptoList[index].image}',height: 30,width: 30,),
                    Text('${cryptoListModel.cryptoList[index].name}'),
                    Text('${cryptoListModel.cryptoList[index].symbol}'),
                    Text('${cryptoListModel.cryptoList[index].currentPrice}'),
                    SizedBox(
                      height: 50,
                    )
                  ], );
                }
              )
          ),
        ]
    )
    );
}
}
