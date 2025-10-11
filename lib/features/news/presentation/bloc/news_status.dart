import 'package:flutter/material.dart';
import 'package:flutter_news_app/features/news/domain/entities/news_response_entity.dart';

@immutable
sealed class NewsStatus {}

class NewsLoading extends NewsStatus {}

class NewsLoaded extends NewsStatus {
  final NewsResponseEntity newsResponseEntity;
  NewsLoaded(this.newsResponseEntity);
}

class NewsError extends NewsStatus {
  final String message;
  NewsError(this.message);
}
