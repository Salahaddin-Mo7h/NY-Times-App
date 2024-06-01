import 'package:dartz/dartz.dart';
import 'package:simple_app/core/error/failure.dart';
import 'package:simple_app/data/api/api_client.dart';
import 'package:simple_app/domain/entities/entities/articels.dart';
import 'package:simple_app/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ApiClient apiClient;

  ArticleRepositoryImpl(this.apiClient);

  @override
  Future<Either<Failure, List<Article>>> getTopStories(String section) async {
    try {
      final response = await apiClient.getTopStories(
          section, 'agcVG4xXwSB3xSAbVvSGDNoe6rJmgZAE');
      final articles = response.results
          ?.map((result) => Article(
                title: result.title!,
                author: result.byline!,
                imageUrl: result.multimedia?.first.url ??
                    'https://es.m.wikipedia.org/wiki/Archivo:Image-not-found.png',
                description: result.abstract!,
                url: result.url!,
              ))
          .toList();
      return Right(articles!);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
