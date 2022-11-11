import 'package:drc_cryptown/pages/chart-page.dart';
import 'package:flutter/material.dart';


class CryptoChartParam extends StatelessWidget {
  const CryptoChartParam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cryptoId = ModalRoute.of(context)!.settings.arguments as String;
    return ChartPage(cryptoId: cryptoId);
  }
}