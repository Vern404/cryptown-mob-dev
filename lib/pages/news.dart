import 'package:drc_cryptown/states/news/news-cubit.dart';
import 'package:drc_cryptown/states/news/news-state.dart';
import 'package:drc_cryptown/widgets/global-widget/nav-bar.dart';
import 'package:drc_cryptown/widgets/news-box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = BlocProvider.of<NewsCubit>(context)
      ..fetchNewsList();
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(152, 203, 255, 1.0),
        centerTitle: true,
        title:Image.asset('assets/image/logo.png',fit: BoxFit.fitWidth,width: 150,),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            child: Text(
              'News',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<NewsCubit, NewsState>(
              bloc: cubit,
              builder: ((context, state) {
                if (state is NewsLoading) {
                  return Center(child: const CircularProgressIndicator());
                }
                if (state is NewsLoaded) {
                  return NewsCard(newsListModel: state.newsListModel);
                }
                return Text(state is NewsError
                    ? state.errorMsg
                    : 'Unknown Error');
              }),
            ),
          ),
        ],
      ),
    );
  }
}
