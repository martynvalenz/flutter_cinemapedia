
import 'package:flutter_cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:flutter_cinemapedia/domain/entities/movie.dart';
import 'package:flutter_cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImplementation extends LocalStorageRepository{
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImplementation(this.datasource);
  
  @override
  Future<bool> isFavorite(int movieId) {
    return datasource.isFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }

}