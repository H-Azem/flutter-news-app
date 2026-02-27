import 'package:flutter/material.dart';
import 'package:flutter_news_app/features/news/domain/entities/article_entity.dart';
import 'package:flutter_news_app/features/news/domain/entities/source_entity.dart';
import 'package:flutter_news_app/features/news/presentation/pages/article_detail_page.dart';
import 'package:flutter_news_app/features/news/presentation/widgets/article_card.dart';

/// Bookmarks screen. Shows saved articles or empty state.
/// For UI demo: shows mock bookmarked items. Real bookmark logic in later lessons.
class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  /// Mock bookmarked articles for UI preview. Replace with Bloc/state in later lessons.
  static List<ArticleEntity> get _mockBookmarks => [
        ArticleEntity(
          id: 'b1',
          title: 'Clean Architecture with BLoC in Flutter',
          description:
              'Learn how to structure your Flutter app using Clean Architecture and BLoC pattern.',
          publishedAt: DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
          source: const SourceEntity(name: 'Flutter Blog'),
          image: 'https://picsum.photos/400/200?random=1',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final hasBookmarks = _mockBookmarks.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: true,
      ),
      body: hasBookmarks
          ? ListView.builder(
              itemCount: _mockBookmarks.length,
              itemBuilder: (context, index) {
                final article = _mockBookmarks[index];
                return ArticleCard(
                  article: article,
                  isBookmarked: true,
                  onTap: () => _openArticleDetail(context, article),
                  onBookmarkTap: () {
                    // Remove bookmark logic in later lessons
                  },
                );
              },
            )
          : _buildEmptyState(context),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_border,
              size: 80,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 24),
            Text(
              'No bookmarks yet',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Save articles from the News tab by tapping the bookmark icon.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
