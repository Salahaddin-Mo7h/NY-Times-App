import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_app/data/models/top_stories.dart';

import 'domain/mock_usecases/FetchArticlesUseCase.dart';
import 'domain/mock_usecases/FilterArticlesUseCase.dart';
import 'domain/mock_usecases/SearchArticlesUseCase.dart';
import 'mock_article_repository.mocks.dart';

void main() {
  late MockArticlesRepository mockArticleRepository;

  setUp(() {
    mockArticleRepository = MockArticlesRepository();
  });

  group('FetchArticlesUseCase', () {
    test('should fetch articles from the repository', () async {
      final usecase = FetchArticlesUseCase(mockArticleRepository);
      final articles = TopStories(status: 'OK', numResults: 10);

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
      const query = 'Flutter';
      final articles = TopStories(status: 'OK', numResults: 5);

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
      const section = 'Technology';
      final articles = TopStories(status: 'OK', numResults: 3);

      when(mockArticleRepository.filterArticles(section))
          .thenAnswer((_) async => articles);

      final result = await usecase.execute(section);

      expect(result, articles);
      verify(mockArticleRepository.filterArticles(section));
      verifyNoMoreInteractions(mockArticleRepository);
    });
  });
}
