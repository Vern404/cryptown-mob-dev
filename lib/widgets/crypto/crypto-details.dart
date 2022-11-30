
import 'package:drc_cryptown/models/Crypto/crypto-details-model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

class CryptoDetailsCard extends StatelessWidget {
  const CryptoDetailsCard({required this.cryptoDetailsModel, Key? key}) : super(key: key);
  final CryptoDetailsModel cryptoDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            children: [
              Text('CRYPTO DETAILS',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
              SizedBox(height: 20,),
              Card(
                color: Color.fromRGBO(123, 123, 255, 1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.network('${cryptoDetailsModel.cryptoDetails.image}',height: 30,),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('${cryptoDetailsModel.cryptoDetails.name}',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),),
                              const SizedBox(height: 10,),
                              Text('${cryptoDetailsModel.cryptoDetails.symbol.toUpperCase()}',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),),
                            ],
                          ),

                        ],
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        children: [
                          Text('USD ${cryptoDetailsModel.cryptoDetails.currentPriceUsd}',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),),
                          const SizedBox(height: 10,),
                          ElevatedButton(
                              onPressed: () => {Navigator.of(context).pushNamed(
                                  '/crypto-chart',
                                  arguments:cryptoDetailsModel.cryptoDetails.cryptoId
                              )},
                              child: Text('View Chart') ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Card(
                color: Color.fromRGBO(20, 1, 144, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Description'.toUpperCase(),
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),),
                      const SizedBox(height: 10,),
                      Text(parse('${cryptoDetailsModel.cryptoDetails.description}').body!.text,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          )),
                        ],
                      )
                      )),
              Card(
                color: Color.fromRGBO(13, 0, 99, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Statistics'.toUpperCase(),
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(123,123, 255, 1),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                              child: Text('MARKET CAP')),
                          Text('${cryptoDetailsModel.cryptoDetails.marketCapUsd}'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(123,123, 255, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Text('MARKET CAP RANK')),
                          Text('${cryptoDetailsModel.cryptoDetails.marketCapRank}'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(123,123, 255, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Text('TOTAL SUPPLY')),
                          Text('${cryptoDetailsModel.cryptoDetails.totalSupply}'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(123,123, 255, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Text('MAX SUPPLY')),
                          Text('${cryptoDetailsModel.cryptoDetails.maxSupply}'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(123,123, 255, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Text('CIRCULATING SUPPLY')),
                          Text('${cryptoDetailsModel.cryptoDetails.circulatingSupply}'),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              Column(
                children: [
                  Card(
                    color: Color.fromRGBO(20, 1, 144, 1.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('ATH(all time high)'.toUpperCase(),
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(123,123, 255, 1),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  children: [
                                    Text('USD ${cryptoDetailsModel.cryptoDetails.ath.usd}',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        )),
                                    const SizedBox(height: 5),
                                    Text('${cryptoDetailsModel.cryptoDetails.ath.changePercentageUsd} %',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(123,123, 255, 0.5),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  children: [
                                    Text('MYR ${cryptoDetailsModel.cryptoDetails.ath.myr}',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        )),
                                    const SizedBox(height: 5),
                                    Text('${cryptoDetailsModel.cryptoDetails.ath.changePercentageMyr}%',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(DateFormat.yMMMd().format(DateTime.parse('${cryptoDetailsModel.cryptoDetails.ath.dateUsd}')))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color.fromRGBO(20, 1, 144, 1.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('ATL(all time low)'.toUpperCase(),
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(123,123, 255, 1),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  children: [
                                    Text('USD ${cryptoDetailsModel.cryptoDetails.atl.usd}',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        )),
                                    const SizedBox(height: 5),
                                    Text('${cryptoDetailsModel.cryptoDetails.atl.changePercentageUsd} %',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(123,123, 255, 0.5),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  children: [
                                    Text('MYR ${cryptoDetailsModel.cryptoDetails.atl.myr}',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        )),
                                    const SizedBox(height: 5),
                                    Text('${cryptoDetailsModel.cryptoDetails.atl.changePercentageMyr} %',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(DateFormat.yMMMd().format(DateTime.parse('${cryptoDetailsModel.cryptoDetails.atl.dateUsd}'))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
