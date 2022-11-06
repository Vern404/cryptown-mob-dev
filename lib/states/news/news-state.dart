import 'package:drc_cryptown/models/News/news-model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsListModel newsListModel;

  NewsLoaded({required this.newsListModel});
}

class NewsError extends NewsState {
  final String errorMsg;

  NewsError({required this.errorMsg});
}