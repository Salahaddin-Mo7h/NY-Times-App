import 'package:dartz/dartz.dart';
import 'package:simple_app/core/error/failure.dart';
import 'package:simple_app/domain/entities/entities/articels.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<Article>>> getTopStories(String section);
}
