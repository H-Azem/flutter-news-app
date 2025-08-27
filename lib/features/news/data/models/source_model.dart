import 'package:flutter_news_app/features/news/domain/entities/source_entity.dart';

/// id : "35303254fdf42d2f3365eadb3d9d8a17"
/// name : "Bloomberg.com"
/// url : "https://www.bloomberg.com"
/// country : "us"

class SourceModel extends SourceEntity {
  const SourceModel({super.id, super.name, super.url, super.country});

  factory SourceModel.fromJson(dynamic json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      country: json['country'],
    );
  }
}
