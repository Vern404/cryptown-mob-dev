import 'package:drc_cryptown/models/News/news-model.dart';
import 'package:drc_cryptown/service/news-service.dart';
import 'package:drc_cryptown/states/news/news-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit <NewsState>{
  NewsCubit():super(NewsLoading());

  Future<void> fetchNewsList() async {
    NewsService newsService = NewsService();

    emit(NewsLoading());

    try {
      NewsListModel newsListModel = await newsService.fetchNewsList();

      emit(NewsLoaded(newsListModel: newsListModel));
    } catch (e) {
      emit(NewsError(errorMsg: e.toString()));
    }
  }
}