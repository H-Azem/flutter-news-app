import 'package:flutter_news_app/features/news/data/models/source_model.dart';
import 'package:flutter_news_app/features/news/domain/entities/article_entity.dart';

/// id : "a4ef5dd2ce3e0d0d4b3572a2ac82628d"
/// title : "US Stock Rally Loses Steam After Fed Rate Cut Enthusiasm Fades"
/// description : "US stocks came off session lows Monday afternoon thanks to an advance in big technology companies, though broader gains were kept in check after last week’s euphoria over the potential for interest-rate cuts faded."
/// content : "US stocks came off session lows Monday afternoon thanks to an advance in big technology companies, though broader gains were kept in check after last week’s euphoria over the potential for interest-rate cuts faded.\nThe S&P 500 Index slipped 0.1% as o... [444 chars]"
/// url : "https://www.bloomberg.com/news/articles/2025-08-25/us-stock-rally-loses-steam-after-fed-rate-cut-enthusiasm-fades"
/// image : "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iSrWNpKFXwLQ/v0/1200x800.jpg"
/// publishedAt : "2025-08-25T16:42:12Z"
/// lang : "en"
/// source : {"id":"35303254fdf42d2f3365eadb3d9d8a17","name":"Bloomberg.com","url":"https://www.bloomberg.com","country":"us"}

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.title,
    super.description,
    super.content,
    super.url,
    super.image,
    super.publishedAt,
    super.lang,
    super.source,
  });

  factory ArticleModel.fromJson(dynamic json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      content: json['content'],
      image: json['image'],
      publishedAt: json['publishedAt'],
      lang: json['lang'],
      source: json['source'] != null
          ? SourceModel.fromJson(json['source'])
          : null,
    );
  }
}
