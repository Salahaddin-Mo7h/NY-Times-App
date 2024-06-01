import 'package:simple_app/data/models/top_stories.dart';

import '../mock _repository/article_repository.dart';

class SearchArticlesUseCase {
  final ArticlesRepository repository;

  SearchArticlesUseCase(this.repository);

  Future<TopStories> execute(String query) async {
    return await repository.searchArticles(query);
  }
}
