# Flutter News App

A Flutter application that displays news articles using the clean architecture approach. This project uses Retrofit for HTTP calls and Riverpod for state management. The application allows users to search for news articles by title or author name and filter them by section. The app is designed to work in both portrait and landscape modes and includes error handling for various scenarios.

## Features

- Clean architecture with data, domain, and presentation layers
- HTTP calls using Retrofit
- State management using Riverpod
- Search functionality by news title or author name
- Filtering by section
- Preloader for search and filtering
- Portrait and landscape mode support
- Error handling for no internet connection, API request errors, and no data scenarios
- Unit tests for all use cases

## Project Structure

```css
lib/
├── data/
│   ├── models/
│   │   └── arts.dart
│   ├── repositories/
│   │   └── article_repository_impl.dart
│   ├── api/
│   │   └── api_client.dart
├── domain/
│   ├── entities/
│   │   └── article.dart
│   ├── repositories/
│   │   └── article_repository.dart
│   ├── usecases/
│   │   └── get_top_stories.dart
│   │   └── fetch_articles_usecase.dart
│   │   └── search_articles_usecase.dart
│   │   └── filter_articles_usecase.dart
├── presentation/
│   ├── pages/
│   │   └── home_page.dart
│   │   └── article_detail_page.dart
│   │   └── webview_page.dart
│   ├── widgets/
│   │   └── article_list.dart
│   ├── providers/
│   │   └── article_provider.dart
├── core/
│   ├── error/
│   │   └── failure.dart
│   ├── network/
│   │   └── network_info.dart
├── locator.dart
├── main.dart
