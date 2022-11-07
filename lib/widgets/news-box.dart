import 'package:drc_cryptown/models/News/news-model.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({required this.newsListModel, Key? key}) : super(key: key);
  final NewsListModel newsListModel;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                shrinkWrap: true,
                itemCount: newsListModel.news.length,
                itemBuilder: (context, index) {
                  return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.network('${newsListModel.news[index].image}'),
                        Text('${newsListModel.news[index].name}'),
                        Text('${newsListModel.news[index].description}'),
                        Text('${newsListModel.news[index].datePublished}'),
                      ],
                  );
                }
              ),
            ),
          ],
        )
      );
  }
}
