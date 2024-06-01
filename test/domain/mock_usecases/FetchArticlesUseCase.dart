import 'package:simple_app/data/models/top_stories.dart';

import '../mock _repository/article_repository.dart';

class FetchArticlesUseCase {
  final ArticlesRepository repository;

  FetchArticlesUseCase(this.repository);

  Future<TopStories> execute() async {
    return await repository.fetchArticles();
  }
}
