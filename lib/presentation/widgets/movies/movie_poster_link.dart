// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_cinemapedia/domain/entities/movie.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;
  const MoviePosterLink({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => context.push('/home/0/movies/${movie.id}'),
      child: FadeInUp(
        child: ClipRRect(
          borderRadius:const BorderRadius.all(Radius.circular(10)),
          child:Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}
