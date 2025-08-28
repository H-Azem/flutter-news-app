import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/features/news/domain/entities/news_response_entity.dart';

abstract class NewsRepository {
  Future<DataState<NewsResponseEntity>> getNews(String category);
}
