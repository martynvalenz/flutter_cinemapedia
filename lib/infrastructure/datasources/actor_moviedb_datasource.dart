
import 'package:dio/dio.dart';
import 'package:flutter_cinemapedia/config/constants/environment.dart';
import 'package:flutter_cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:flutter_cinemapedia/domain/entities/actor.dart';
import 'package:flutter_cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:flutter_cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDBDatasource extends ActorsDatasource{
  final dio = Dio(BaseOptions(
    baseUrl:Environment.movieDBUrl,
    queryParameters:{
      'api_key':Environment.movieDBKey,
      'language':'es-MX'
    }
  ));

  @override 
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    final response = await dio.get('/movie/$movieId/credits');
    
    return _jsonToActors(response.data);
  }

  List<Actor> _jsonToActors(Map<String,dynamic> json){
    final creditsResponse = CreditsResponse.fromJson(json);

    final List<Actor> actors = creditsResponse.cast
    // .where((actor) => actor.profilePath != 'no-poster')
    .map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();

    return actors;
  }
}