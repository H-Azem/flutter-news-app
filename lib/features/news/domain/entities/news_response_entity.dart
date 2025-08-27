import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/features/news/domain/entities/article_entity.dart';

class NewsResponseEntity extends Equatable {
  final int? totalArticles;
  final List<ArticleEntity>? articles;
  const NewsResponseEntity({this.totalArticles, this.articles});

  @override
  List<Object?> get props => [totalArticles, articles];
}
