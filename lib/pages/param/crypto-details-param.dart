import 'package:drc_cryptown/pages/crypto-details-page.dart';
import 'package:flutter/material.dart';


class CryptoDetailsParam extends StatelessWidget {
  const CryptoDetailsParam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cryptoId = ModalRoute.of(context)!.settings.arguments as String;
    return CryptoDetailsPage(cryptoId: cryptoId);
  }
}