part of 'news_bloc.dart';

class NewsState {
  NewsStatus newsStatus;
  NewsState({required this.newsStatus});

  NewsState copyWith({NewsStatus? newsStatus}) {
    return NewsState(newsStatus: newsStatus ?? this.newsStatus);
  }
}
