
import 'package:flutter_cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:flutter_cinemapedia/domain/entities/movie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

class IsarDatasource extends LocalStorageDatasource{
  late Future<Isar> db;
  IsarDatasource(){
    db = openDB();
  }

  Future<Isar> openDB() async {
    if(Isar.instanceNames.isEmpty){
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [MovieSchema], 
        inspector: true, 
        directory: dir.path
      );
    }

    return Future.value(Isar.getInstance());
  }
  
  @override
  Future<bool> isFavorite(int movieId) async{
    final isar = await db;

    final Movie? isFavoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movieId)
      .findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async{
    final isar = await db;

    final Movie? favoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movie.id)
      .findFirst();

    if(favoriteMovie != null){
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return;
    }else{
      isar.writeTxnSync(() => isar.movies.putSync(movie));
    }
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async{
    final isar = await db;

    return isar.movies
      .where()
      .offset(offset)
      .limit(limit)
      .findAll();
  }
}