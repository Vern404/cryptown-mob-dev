
import 'package:drc_cryptown/models/Crypto/crypto-details-model.dart';
import 'package:drc_cryptown/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';

class CryptoDetailsCard extends StatelessWidget {
  const CryptoDetailsCard({required this.cryptoDetailsModel, required this.dailyChart, Key? key}) : super(key: key);
  final CryptoDetailsModel cryptoDetailsModel;
  final DailyChart dailyChart;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('${cryptoDetailsModel.cryptoDetails.name}'),
            Text('${cryptoDetailsModel.cryptoDetails.symbol}'),
            Text('${cryptoDetailsModel.cryptoDetails.currentPriceUsd}'),
            Text('Chart'),
            // Chart(dailyChart: dailyChart),
            Text('Description'),
            Text('${cryptoDetailsModel.cryptoDetails.description}'),

            Text('Statistics'),
            Text('${cryptoDetailsModel.cryptoDetails.marketCapUsd}'),
            Text('${cryptoDetailsModel.cryptoDetails.marketCapRank}'),
            Text('${cryptoDetailsModel.cryptoDetails.totalSupply}'),
            Text('${cryptoDetailsModel.cryptoDetails.maxSupply}'),
            Text('${cryptoDetailsModel.cryptoDetails.circulatingSupply}'),
            Row(
              children: [
                Card(
                  child: Column(
                    children: [
                      Text('ATH(all time high)'),
                      Text('${cryptoDetailsModel.cryptoDetails.ath.usd}'),
                      Text('${cryptoDetailsModel.cryptoDetails.ath.changePercentageUsd}'),
                      Text('${cryptoDetailsModel.cryptoDetails.ath.myr}'),
                      Text('${cryptoDetailsModel.cryptoDetails.ath.changePercentageMyr}'),
                      Text('${cryptoDetailsModel.cryptoDetails.ath.dateUsd}')
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Text('ATL(all time low)'),
                      Text('${cryptoDetailsModel.cryptoDetails.atl.usd}'),
                      Text('${cryptoDetailsModel.cryptoDetails.atl.changePercentageUsd}'),
                      Text('${cryptoDetailsModel.cryptoDetails.atl.myr}'),
                      Text('${cryptoDetailsModel.cryptoDetails.atl.changePercentageMyr}'),
                      Text('${cryptoDetailsModel.cryptoDetails.atl.dateUsd}')
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
