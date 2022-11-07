import 'package:drc_cryptown/models/Exchange-List/exchange-list-model.dart';
import 'package:flutter/material.dart';

class ExchangeListCard extends StatelessWidget {
  const ExchangeListCard({required this.exchangeListModel, Key? key}) : super(key: key);
  final ExchangeListModel exchangeListModel;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: exchangeListModel.exchange.length,
                  itemBuilder: (context, index) {
                    return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    child:Image.network('${exchangeListModel.exchange[index].image}') ,
                                  )
                                  ,
                                  Text('${exchangeListModel.exchange[index].name}'),
                                  Text('${exchangeListModel.exchange[index].yearEstablished}'),
                                  Text('${exchangeListModel.exchange[index].country}'),
                                ]
                              ),
                              Text('${exchangeListModel.exchange[index].trustScore}'),
                              Text('${exchangeListModel.exchange[index].tradeVolume24HBtc}')
                            ],
                          )
                         
                        ]
                    );
                  }
              ),
            ),
          ],
        )
    );
  }
}
