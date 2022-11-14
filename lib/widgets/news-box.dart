import 'package:drc_cryptown/models/News/news-model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({required this.newsListModel, Key? key}) : super(key: key);
  final NewsListModel newsListModel;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: newsListModel.news.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () async{
                  var url = '${newsListModel.news[index].url}';
                  if(await canLaunchUrlString(url)){
                    await launchUrlString(url);
                  } else {
                  throw 'Could not launch $url';
                  }
                },
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.network(
                        '${newsListModel.news[index].image}',
                        width: 130,
                        height: 130,
                      ),
                      Text('${newsListModel.news[index].name}'),
                      Text('${newsListModel.news[index].description}'),
                      Text('${newsListModel.news[index].datePublished}'),
                    ],
                ),
              ),
            );
          }
        ),
      );
  }
}
