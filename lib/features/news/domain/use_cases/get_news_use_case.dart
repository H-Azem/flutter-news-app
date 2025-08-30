import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/core/use_cases/use_case.dart';
import 'package:flutter_news_app/features/news/domain/entities/news_response_entity.dart';
import 'package:flutter_news_app/features/news/domain/repositories/news_repository.dart';

class GetNewsUseCase extends UseCase<DataState<NewsResponseEntity>, String> {
  final NewsRepository newsRepository;
  GetNewsUseCase(this.newsRepository);

  @override
  Future<DataState<NewsResponseEntity>> call(String category) {
    return newsRepository.getNews(category);
  }
}
