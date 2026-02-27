import 'package:flutter/material.dart';
import 'package:flutter_news_app/features/news/presentation/pages/bookmarks_page.dart';
import 'package:flutter_news_app/features/news/presentation/pages/news_list_page.dart';

/// Root layout: bottom navigation with News and Bookmarks tabs.
/// Keeps both tabs in memory via IndexedStack for simple UI demo.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  static const _tabs = [
    _TabData(icon: Icons.article_outlined, label: 'News'),
    _TabData(icon: Icons.bookmark_border, label: 'Bookmarks'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          NewsListPage(),
          BookmarksPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: _tabs
            .map(
              (t) => NavigationDestination(
                icon: Icon(t.icon),
                selectedIcon: Icon(t.icon),
                label: t.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TabData {
  final IconData icon;
  final String label;
  const _TabData({required this.icon, required this.label});
}
