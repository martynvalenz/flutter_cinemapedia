import 'package:flutter_cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';
import '../../domain/entities/movie.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath: movieDB.backdropPath == '' ? 
      'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg'
      : 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}',
    genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalTitle,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath: movieDB.posterPath == '' ? 
      'no-poster'
      : 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}',
    releaseDate: movieDB.releaseDate,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount,
  );
}