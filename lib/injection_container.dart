import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:moviedb/features/movies/data/data_sources/remote/themoviedb_api_data_source.dart';
import 'package:moviedb/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:moviedb/features/movies/domain/repositories/movie_repository.dart';
import 'package:moviedb/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:moviedb/features/movies/presentation/bloc/movies_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features
  _initMovieFeature();

  // External
  sl.registerLazySingleton(() => http.Client());
}

void _initMovieFeature() {
  // Bloc
  sl.registerFactory(
    () => MoviesBloc(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetMoviesUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<TheMovieDbApiDataSource>(
    () => TheMovieDbApiDataSourceImpl(sl()),
  );
}