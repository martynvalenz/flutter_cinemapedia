import 'package:flutter_cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:flutter_cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';
import '../../domain/entities/movie.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movie) => Movie(
    adult: movie.adult,
    backdropPath: movie.backdropPath == '' ? 
      'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg'
      : 'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
    genreIds: movie.genreIds.map((e) => e.toString()).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: movie.posterPath == '' ? 
      'https://viterbi-web.usc.edu/~zexunyao/itp301/Assignment_07/img.jpeg'
      : 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
    releaseDate: movie.releaseDate != null ? movie.releaseDate! : DateTime.now() ,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
    adult: movie.adult,
    backdropPath: movie.backdropPath == '' ? 
      'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg'
      : 'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
    genreIds: movie.genres.map((e) => e.name.toString()).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: movie.posterPath == '' ? 
      'https://viterbi-web.usc.edu/~zexunyao/itp301/Assignment_07/img.jpeg'
      : 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
}