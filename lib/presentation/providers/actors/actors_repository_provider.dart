

// * Este repositorio es inmutable, no cambia, es de solo lectura.
import 'package:flutter_cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:flutter_cinemapedia/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDBDatasource());
});