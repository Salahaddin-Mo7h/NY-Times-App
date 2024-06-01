Flutter News App

# Overview

This Flutter application is designed to fetch, search, and filter news articles. The app follows the Clean Architecture pattern and is built with the following features:

Fetch news articles from an API.
Search articles by title or author.
Filter articles by section.
Switch between list and card view.
Display article details with a web view to read more.
Handle errors like no internet connection, API request errors, and no data to show.
Support both portrait and landscape modes.
Include unit tests for all use cases.
Features

# Home Page:

# Search field.

1) Dropdown list for filtering by section.
2) Icons to switch between list view and card view.
3) Display articles in the chosen view format.
   
# Details Page:

1) Display a large image.
2) Show article title, description, and author.
3) "See more" button to open and preview the article in a WebView.
Architecture

The application is built using Clean Architecture and includes the following layers:

# Presentation Layer: Handles the UI and user interactions.
# Domain Layer: Contains the business logic, including use cases and repository interfaces.
# Data Layer: Manages data sources, network calls, and data models.

#Libraries Used

1) Retrofit: For making HTTP calls.
2) Riverpod: For state management.
3) Get_it: For dependency injection.
4) Mockito: For creating mock objects in tests.


#Project Structure

lib/
|- data/
|  |- models/
|  |  |- arts.dart
|  |- repositories/
|  |  |- article_repository_impl.dart
|  |- api/
|  |  |- api_client.dart
|- domain/
|  |- entities/
|  |  |- article.dart
|  |- repositories/
|  |  |- article_repository.dart
|  |- usecases/
|  |  |- get_top_stories.dart
|- presentation/
|  |- pages/
|  |  |- home_page.dart
|  |  |- article_detail_page.dart
|  |  |- webview_page.dart
|  |- widgets/
|  |  |- article_list.dart
|  |- providers/
|  |  |- article_provider.dart
|- core/
|  |- error/
|  |  |- failure.dart
|  |- network/
|  |  |- network_info.dart
|- locator.dart
|- main.dart

Detailed Descriptions

1. Data Layer
Models: Represents the data structures used in the app (e.g., Arts, Results, Multimedia).
Repositories: Implements the ArticleRepository interface, handling data operations and network calls.
Sources: Manages remote data sources using Retrofit for HTTP calls.
2. Domain Layer
Entities: Defines core entities used throughout the app.
Repositories: Abstract classes that define the contract for data operations.
Use Cases: Contains business logic for fetching, searching, and filtering articles.
3. Presentation Layer
Pages: Contains UI pages like HomePage and DetailsPage.
Widgets: Reusable UI components like ArticleListItem.
ViewModels: Manages state and logic for the UI, using Riverpod for state management.
Use Cases

FetchArticlesUseCase
dart
Copy code
import '../entities/arts.dart';
import '../repositories/article_repository.dart';

class FetchArticlesUseCase {
  final ArticleRepository repository;

  FetchArticlesUseCase(this.repository);

  Future<Arts> execute() async {
    return await repository.fetchArticles();
  }
}

SearchArticlesUseCase
dart
Copy code
import '../entities/arts.dart';
import '../repositories/article_repository.dart';

class SearchArticlesUseCase {
  final ArticleRepository repository;

  SearchArticlesUseCase(this.repository);

  Future<Arts> execute(String query) async {
    return await repository.searchArticles(query);
  }
}

FilterArticlesUseCase
dart
Copy code
import '../entities/arts.dart';
import '../repositories/article_repository.dart';

class FilterArticlesUseCase {
  final ArticleRepository repository;

  FilterArticlesUseCase(this.repository);

  Future<Arts> execute(String section) async {
    return await repository.filterArticles(section);
  }
}

# Unit Tests

Unit Test for Use Cases
usecase_tests.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_project/domain/entities/arts.dart';
import 'package:your_project/domain/repositories/article_repository.dart';
import 'package:your_project/domain/usecases/fetch_articles_usecase.dart';
import 'package:your_project/domain/usecases/search_articles_usecase.dart';
import 'package:your_project/domain/usecases/filter_articles_usecase.dart';
import 'mock_article_repository.mocks.dart';

void main() {
  late MockArticleRepository mockArticleRepository;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
  });

  group('FetchArticlesUseCase', () {
    test('should fetch articles from the repository', () async {
      final usecase = FetchArticlesUseCase(mockArticleRepository);
      final articles = Arts(status: 'OK', numResults: 10);

      when(mockArticleRepository.fetchArticles())
          .thenAnswer((_) async => articles);

      final result = await usecase.execute();

      expect(result, articles);
      verify(mockArticleRepository.fetchArticles());
      verifyNoMoreInteractions(mockArticleRepository);
    });
  });

  group('SearchArticlesUseCase', () {
    test('should search articles by query from the repository', () async {
      final usecase = SearchArticlesUseCase(mockArticleRepository);
      final query = 'Flutter';
      final articles = Arts(status: 'OK', numResults: 5);

      when(mockArticleRepository.searchArticles(query))
          .thenAnswer((_) async => articles);

      final result = await usecase.execute(query);

      expect(result, articles);
      verify(mockArticleRepository.searchArticles(query));
      verifyNoMoreInteractions(mockArticleRepository);
    });
  });

  group('FilterArticlesUseCase', () {
    test('should filter articles by section from the repository', () async {
      final usecase = FilterArticlesUseCase(mockArticleRepository);
      final section = 'Technology';
      final articles = Arts(status: 'OK', numResults: 3);

      when(mockArticleRepository.filterArticles(section))
          .thenAnswer((_) async => articles);

      final result = await usecase.execute(section);

      expect(result, articles);
      verify(mockArticleRepository.filterArticles(section));
      verifyNoMoreInteractions(mockArticleRepository);
    });
  });
}

Contributions

Feel free to contribute to this project by creating pull requests, reporting issues, or suggesting features.
