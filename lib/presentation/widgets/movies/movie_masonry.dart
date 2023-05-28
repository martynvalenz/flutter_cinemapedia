// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_cinemapedia/domain/entities/movie.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'movie_poster_link.dart';

class MovieMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieMasonry({
    Key? key,
    required this.movies,
    this.loadNextPage,
  }) : super(key: key);

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(widget.loadNextPage == null) return;

      if((scrollController.position.pixels + 100) >= scrollController.position.maxScrollExtent){
        widget.loadNextPage?.call();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        itemCount: widget.movies.length,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        controller:scrollController,
        itemBuilder: (context, index){
          if(index == 1){
            return Column(
              children: [
                const SizedBox(height:30),
                MoviePosterLink(
                  movie:widget.movies[index]
                )
              ],
            );
          }
          final movie = widget.movies[index];
          return MoviePosterLink(
            movie:movie
          );
        },
      ),
    );
  }
}