import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_app/core/network/network_info.dart';
import 'package:simple_app/data/api/api_client.dart';
import 'package:simple_app/data/repositories/article_repository_impl.dart';
import 'package:simple_app/domain/repositories/article_repository.dart';
import 'package:simple_app/domain/usecases/get_top_stories.dart';

final getIt = GetIt.instance;

void setup() {
  // External
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => Connectivity());

  // Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // API
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));

  // Repository
  getIt.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(getIt<ApiClient>()));

  // Use cases
  getIt.registerLazySingleton(() => GetTopStories(getIt()));
}
