import 'package:drc_cryptown/models/Exchange-List/exchange-list-model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ExchangeListCard extends StatelessWidget {
  const ExchangeListCard({required this.exchangeListModel, Key? key}) : super(key: key);
  final ExchangeListModel exchangeListModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          itemCount: exchangeListModel.exchange.length,
          itemBuilder: (context, index) {
            return Card(
              color: Color.fromRGBO(127, 156, 200, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    Uri _url = Uri.parse('${exchangeListModel.exchange[index].url}');
                    if (!await launchUrl(_url)) {
                      throw 'Could not launch $_url';
                    }
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 1),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                child: Image.network('${exchangeListModel
                                    .exchange[index].image}'),
                              ),
                              Text('${exchangeListModel.exchange[index].name}',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    )
                                ),),
                              Text('${exchangeListModel.exchange[index]
                                  .yearEstablished}'),
                              Text(
                                  '${exchangeListModel.exchange[index].country}'),
                            ]
                        ),
                        const SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // const SizedBox(width: 20),
                            Text('${exchangeListModel.exchange[index].trustScore}',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                              )
                            ),),
                            const SizedBox(width: 30),
                            Text('${exchangeListModel.exchange[index].tradeVolume24HBtc}'),
                            const SizedBox(width: 5),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

    );
  }
}
