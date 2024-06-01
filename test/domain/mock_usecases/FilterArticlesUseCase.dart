import 'package:simple_app/data/models/top_stories.dart';

import '../mock _repository/article_repository.dart';

class FilterArticlesUseCase {
  final ArticlesRepository repository;

  FilterArticlesUseCase(this.repository);

  Future<TopStories> execute(String section) async {
    return await repository.filterArticles(section);
  }
}
