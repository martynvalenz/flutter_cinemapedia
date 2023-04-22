
import 'package:flutter_cinemapedia/infrastructure/models/moviedb/credits_response.dart';

import '../../domain/entities/actor.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null 
      ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}' 
      : 'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
    character: cast.character ?? '',
  );
}