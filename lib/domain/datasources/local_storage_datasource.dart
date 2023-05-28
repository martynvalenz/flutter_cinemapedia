
import 'package:flutter_cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isFavorite(int movieId);
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}