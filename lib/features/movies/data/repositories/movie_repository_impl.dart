import 'package:dartz/dartz.dart';
import 'package:moviedb/core/domain/entities/movie.dart';
import 'package:moviedb/core/error/exception.dart';
import 'package:moviedb/core/error/failure.dart';
import 'package:moviedb/features/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:moviedb/features/movies/domain/entities/movie_details.dart';
import 'package:moviedb/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteDataSource _moviesApiDataSource;

  MovieRepositoryImpl(this._moviesApiDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(
      {int page = 1}) async {
    try {
      final movies = await _moviesApiDataSource.getPopularMovies(page: page);
      return Right(movies.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      final movieDetails =
          await _moviesApiDataSource.getMovieDetails(movieId: movieId);
      return Right(movieDetails.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    }
  }
}
