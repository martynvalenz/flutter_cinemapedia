import 'package:flutter_cinemapedia/domain/entities/movie.dart';
import 'package:flutter_cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:flutter_cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
{
  1234": Movie(),
  1235": Movie(),
  1236": Movie(),
}
*/

final favoriteMoviesProvider = StateNotifierProvider<StorageMoviesNotifier, Map<int,Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(
    localStorageRepository: localStorageRepository
  );
});

class StorageMoviesNotifier extends StateNotifier<Map<int,Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;
  StorageMoviesNotifier({
    required this.localStorageRepository
  }):super({});

  Future<List<Movie>> loadNextPage() async{
    final movies = await localStorageRepository.loadMovies(
      limit: 15,
      offset: page * 10,
    );
    page++;
    state = {
      ...state,
      for(final movie in movies) movie.id: movie
    };
    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;
    if(isMovieInFavorites){
      state.remove(movie.id);
      state = {...state};
    }
    else{
      state = {
        ...state,
        movie.id: movie
      };
    }
  }

  // Future<void> loadNextPage() async{
  //   final movies = await localStorageRepository.loadMovies(
  //     limit: 10,
  //     offset: page * 10
  //   );
  //   page++;

  //   final tempMoviesMap = <int, Movie> {};
  //   for(final movie in movies){
  //     tempMoviesMap[movie.id] = movie;
  //   }

  //   state = {
  //     ...state,
  //     ...tempMoviesMap
  //   };
  // }
}