import 'package:dartz/dartz.dart';
import 'package:simple_app/core/error/failure.dart';
import 'package:simple_app/domain/entities/entities/articels.dart';
import 'package:simple_app/domain/repositories/article_repository.dart';

class GetTopStories {
  final ArticleRepository repository;

  GetTopStories(this.repository);

  Future<Either<Failure, List<Article>>> call(String section) async {
    return await repository.getTopStories(section);
  }
}
