
import 'package:drc_cryptown/models/News/news-model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({required this.newsListModel, Key? key}) : super(key: key);
  final NewsListModel newsListModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          itemCount: newsListModel.news.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 15.0 ),
              child: InkWell(
                onTap: () async {
                  Uri _url = Uri.parse('${newsListModel.news[index].url}');
                  if (!await launchUrl(_url)) {
                    throw 'Could not launch $_url';
                  }
                },
                child: Card(
                  color: Color.fromRGBO(127, 156, 200, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.network(
                            '${newsListModel.news[index].image}',
                            width: MediaQuery.of(context).size.width,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 30),
                          Text('${newsListModel.news[index].name}',
                              textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ))
                          ),
                          const SizedBox(height: 10),
                          Text('${newsListModel.news[index].description}',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                ))
                          ),
                          const SizedBox(height: 20),
                          Text('${newsListModel.news[index].datePublished}'),
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
