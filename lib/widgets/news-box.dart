import 'package:drc_cryptown/models/News/news-model.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({required this.newsListModel, Key? key}) : super(key: key);
  final NewsListModel newsListModel;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                shrinkWrap: true,
                itemCount: newsListModel.newsList.length,
                itemBuilder: (context, index) {
                  return Column(
                      children: [
                        Image.network('${newsListModel.newsList[index].image}'),
                        Text('${newsListModel.newsList[index].name}'),
                        Text('${newsListModel.newsList[index].description}'),
                        Text('${newsListModel.newsList[index].datePublished}'),
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
