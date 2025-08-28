import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/features/news/data/data_source/remote/news_api_client.dart';
import 'package:flutter_news_app/features/news/data/models/news_response_model.dart';
import 'package:flutter_news_app/features/news/domain/entities/news_response_entity.dart';
import 'package:flutter_news_app/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsApiClient newsApiClient;

  NewsRepositoryImpl(this.newsApiClient);

  @override
  Future<DataState<NewsResponseEntity>> getNews(String category) async {
    try {
      Response response = await newsApiClient.fetchNewsByCategory(category);

      if (response.statusCode == 200) {
        NewsResponseEntity newsResponseEntity = NewsResponseModel.fromJson(
          response.data,
        );
        return DataSuccess(newsResponseEntity);
      } else {
        // you can handle different status codes separately here
        return DataFailed('Unexpected status code');
      }
    } catch (e) {
      // handle dio exceptions here or other errors
      return DataFailed(e.toString());
    }
  }
}
