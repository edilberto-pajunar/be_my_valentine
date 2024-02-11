import 'package:be_my_valentine/src/data/data_sources/remote/news_api_service.dart';
import 'package:be_my_valentine/src/data/data_sources/remote/photo_remote_data_source.dart';
import 'package:be_my_valentine/src/data/repository/article_repository_impl.dart';
import 'package:be_my_valentine/src/data/repository/photo_repository_impl.dart';
import 'package:be_my_valentine/src/domain/repository/article_repository.dart';
import 'package:be_my_valentine/src/domain/repository/photo_repository.dart';
import 'package:be_my_valentine/src/domain/usecases/photos/add_photo.dart';
import 'package:be_my_valentine/src/domain/usecases/get_article.dart';
import 'package:be_my_valentine/src/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:be_my_valentine/src/presentation/bloc/photos/photo_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {

  print("get it initialized!");

  /// register singleton preserved the state of an instance
  // locator.registerSingleton<AppService>(AppService());

  /// register lazy singleton called once it triggered
  /// but still preserved the state of an instance
  // locator.registerLazySingleton<AppService>(() => AppService());

  /// register factory will create always a new instance
  // locator.registerFactory<AppService>(() => AppService());

  // App Logic -> Use cases -> Repositories -> Data Sources -> External Dependencies

  // Blocs
  // App Logic
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
  sl.registerFactory<PhotoBloc>(() => PhotoBloc(sl()));

  // Use cases
  sl.registerLazySingleton<GetArticleUseCase>(() => GetArticleUseCase(sl()));
  sl.registerLazySingleton<AddPhotoUseCase>(() => AddPhotoUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<ArticleRepository>(() => ArticleRepositoryImpl(sl()));
  sl.registerLazySingleton<PhotoRepository>(() => (PhotoRepositoryImpl(sl())));

  // Data Sources
  sl.registerLazySingleton<NewsApiService>(() => NewsApiServiceImpl(sl()));

  // External Dependencies
  sl.registerLazySingleton(http.Client.new);
  sl.registerLazySingleton(() => FirebaseStorage.instance);
}

