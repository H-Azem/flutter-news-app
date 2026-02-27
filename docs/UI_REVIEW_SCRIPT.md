# UI Overview — Flutter News App (Clean Architecture with BLoC)

This document is a short walkthrough of the **UI layer only**. Logic, BLoC wiring, and data flow are covered in later lessons.

---

## 1. App entry and shell

- **`main.dart`**  
  - Registers dependencies with `setupServiceLocator()` and runs the app.  
  - `MaterialApp` uses `AppTheme.lightTheme` and `AppTheme.darkTheme`.  
  - `MultiBlocProvider` supplies `NewsBloc` to the tree; the UI does not use it yet (mock data only).

- **`core/widgets/app_shell.dart`**  
  - Root layout with **bottom navigation**: two destinations, **News** and **Bookmarks**.  
  - Uses `IndexedStack` so both tabs keep their state when switching.  
  - `NavigationBar` (Material 3) switches between `NewsListPage` and `BookmarksPage`.

---

## 2. Theme

- **`config/app_theme.dart`**  
  - **Light / dark** themes with `useMaterial3: true` and `ColorScheme.fromSeed`.  
  - **AppBar**: centered title, no elevation by default, scrolled-under elevation.  
  - **Card**: rounded corners (12), slight elevation, `clipBehavior` for images.  
  - **NavigationBar**: fixed height, label text style for selected vs unselected.

---

## 3. News list

- **`features/news/presentation/pages/news_list_page.dart`**  
  - **News** tab content.  
  - Uses a **mock list** of `ArticleEntity` (`_mockArticles`) so the UI can be shown without real API or BLoC.  
  - `ListView.builder` builds one **`ArticleCard`** per article.  
  - **Tap on card** → navigates to `ArticleDetailPage(article)`.  
  - **Bookmark icon** on the card has an empty `onBookmarkTap`; logic comes in later lessons.

---

## 4. Article card (reusable widget)

- **`features/news/presentation/widgets/article_card.dart`**  
  - **Inputs**: `ArticleEntity`, optional `onTap`, `onBookmarkTap`, and `isBookmarked`.  
  - **Layout**:  
    - Top: image (or placeholder if no URL / load error).  
    - Below: source name, relative date (e.g. "2h ago"), title, short description.  
    - Bottom: bookmark icon (outline when not saved, filled when bookmarked).  
  - **Image**: `Image.network` with `loadingBuilder` and `errorBuilder` so we always show something (loading, image, or placeholder).  
  - **Date**: `_formatDate` turns `publishedAt` into a relative string (e.g. "2h ago", "1d ago").

This widget is used on both **News** and **Bookmarks** screens.

---

## 5. Article detail

- **`features/news/presentation/pages/article_detail_page.dart`**  
  - Full-screen article view.  
  - **Input**: one `ArticleEntity` (passed when navigating from a card).  
  - **Content**: large image (or placeholder), source and date, title, description, and optional body (`content`).  
  - **AppBar**: back button and a bookmark action (no logic yet).  
  - **Scrolling**: `SingleChildScrollView` for long content.

---

## 6. Bookmarks

- **`features/news/presentation/pages/bookmarks_page.dart`**  
  - **Bookmarks** tab content.  
  - Uses a **mock list** of bookmarked articles (`_mockBookmarks`).  
  - If the list is **empty**: shows an **empty state** (icon, “No bookmarks yet”, short hint to save from News tab).  
  - If not empty: same **`ArticleCard`** as the news list, with `isBookmarked: true` and tap opening `ArticleDetailPage`.  
  - Add/remove bookmark logic is left for later lessons.

---

## 7. Summary for the course

| Part            | Role in UI |
|-----------------|------------|
| **AppShell**    | Bottom nav + holds News and Bookmarks pages. |
| **Theme**       | Material 3, light/dark, AppBar, Card, NavigationBar. |
| **NewsListPage**| List of articles (mock), tap → detail, bookmark icon placeholder. |
| **ArticleCard** | Reusable row/card: image, source, date, title, description, bookmark. |
| **ArticleDetailPage** | Single article: image, source, date, title, description, content. |
| **BookmarksPage** | List of bookmarked articles (mock) or empty state. |

All screens and widgets are **presentation-only** and use **mock data**. In the next lessons you will replace mock lists with BLoC state, connect the bookmark icon to real bookmark logic, and load articles from the API.
