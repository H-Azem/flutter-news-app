import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/features/news/domain/entities/source_entity.dart';

class ArticleEntity extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? content;
  final String? url;
  final String? image;
  final String? publishedAt;
  final String? lang;
  final SourceEntity? source;

  const ArticleEntity({
    this.id,
    this.title,
    this.description,
    this.content,
    this.url,
    this.image,
    this.publishedAt,
    this.lang,
    this.source,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    content,
    url,
    image,
    publishedAt,
    lang,
    source,
  ];
}
