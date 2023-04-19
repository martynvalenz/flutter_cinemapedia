

import 'package:flutter_cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/repositories/movie_repository_impl.dart';

// * Este repositorio es inmutable, no cambia, es de solo lectura.
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});