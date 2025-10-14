import 'package:flutter_news_app/features/news/data/data_source/remote/news_api_client.dart';
import 'package:flutter_news_app/features/news/data/repositories/news_repository_impl.dart';
import 'package:flutter_news_app/features/news/domain/repositories/news_repository.dart';
import 'package:flutter_news_app/features/news/domain/use_cases/get_news_use_case.dart';
import 'package:flutter_news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Core
  serviceLocator.registerLazySingleton<NewsApiClient>(() => NewsApiClient());

  // Repositories
  serviceLocator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(serviceLocator<NewsApiClient>()),
  );

  // Use Cases
  serviceLocator.registerLazySingleton<GetNewsUseCase>(
    () => GetNewsUseCase(serviceLocator<NewsRepository>()),
  );

  // Blocs
  serviceLocator.registerFactory<NewsBloc>(
    () => NewsBloc(serviceLocator<GetNewsUseCase>()),
  );
}
