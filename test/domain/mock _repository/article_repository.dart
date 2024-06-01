import 'package:simple_app/data/models/top_stories.dart';

abstract class ArticlesRepository {
  Future<TopStories> fetchArticles();
  Future<TopStories> searchArticles(String query);
  Future<TopStories> filterArticles(String section);
}
