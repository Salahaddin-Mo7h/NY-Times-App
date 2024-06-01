import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_app/domain/entities/entities/articels.dart';
import 'package:simple_app/domain/usecases/get_top_stories.dart';
import 'package:simple_app/locator.dart';

final articleProvider =
    FutureProvider.family<List<Article>, String>((ref, section) async {
  final getTopStories = getIt<GetTopStories>();
  final result = await getTopStories(section);
  return result.fold(
    (failure) => throw failure,
    (articles) => articles,
  );
});
