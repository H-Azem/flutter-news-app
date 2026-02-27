import 'package:flutter/material.dart';
import 'package:flutter_news_app/features/news/domain/entities/article_entity.dart';
import 'package:flutter_news_app/features/news/domain/entities/source_entity.dart';
import 'package:flutter_news_app/features/news/presentation/pages/article_detail_page.dart';
import 'package:flutter_news_app/features/news/presentation/widgets/article_card.dart';

/// News list screen. Displays a list of article cards.
/// For UI demo only: uses mock data. Logic and Bloc integration in later lessons.
class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  /// Mock articles for UI preview. Replace with Bloc state in later lessons.
  static List<ArticleEntity> get _mockArticles => [
    ArticleEntity(
      id: '1',
      title: 'Clean Architecture with BLoC in Flutter',
      description:
          'Learn how to structure your Flutter app using Clean Architecture and BLoC pattern for state management.',
      publishedAt: DateTime.now()
          .subtract(const Duration(hours: 2))
          .toIso8601String(),
      source: const SourceEntity(name: 'Flutter Blog'),
      image: 'https://picsum.photos/400/200?random=1',
    ),
    ArticleEntity(
      id: '2',
      title: 'Getting Started with Flutter State Management',
      description:
          'An overview of different state management solutions and when to use each approach in your project.',
      publishedAt: DateTime.now()
          .subtract(const Duration(days: 1))
          .toIso8601String(),
      source: const SourceEntity(name: 'Tech News'),
      image: 'https://picsum.photos/400/200?random=2',
    ),
    ArticleEntity(
      id: '3',
      title: 'Building Scalable Mobile Apps',
      description:
          'Best practices for organizing code, dependency injection, and testing in large Flutter applications.',
      publishedAt: DateTime.now()
          .subtract(const Duration(days: 2))
          .toIso8601String(),
      source: const SourceEntity(name: 'Dev Weekly'),
      image: 'https://picsum.photos/400/200?random=3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Azem News'), centerTitle: true),
      body: ListView.builder(
        itemCount: _mockArticles.length,
        itemBuilder: (context, index) {
          final article = _mockArticles[index];
          return ArticleCard(
            article: article,
            isBookmarked: false,
            onTap: () => _openArticleDetail(context, article),
            onBookmarkTap: () {
              // Bookmark logic in later lessons
            },
          );
        },
      ),
    );
  }

  void _openArticleDetail(BuildContext context, ArticleEntity article) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => ArticleDetailPage(article: article),
      ),
    );
  }
}
