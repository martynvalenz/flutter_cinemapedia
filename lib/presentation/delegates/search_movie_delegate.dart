
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinemapedia/domain/entities/movie.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});
  
  @override
  String? get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate:query.isNotEmpty,
        child: IconButton(
          onPressed: () => query = '',
          icon:const Icon(Icons.clear)
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon:const Icon(Icons.arrow_back_ios_new_outlined),
      onPressed:() => close(context, null)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future:searchMovies(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount:movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieItem(movie: movie);
          },
        );
      }
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:const EdgeInsets.symmetric(horizontal:10, vertical: 5),
      child: Row(
        children:[
          // Image
          SizedBox(
            width: size.width * 0.2,
            child: ClipRRect(
              borderRadius:BorderRadius.circular(10),
              child: Image.network(
                movie.posterPath,
                loadingBuilder: (context, child,loadingProgress){
                  if(loadingProgress == null) return FadeIn(child: child);
                  return const SizedBox();
                },
              ),
            ),
          ),
          const SizedBox(width:10),
          // Description
          SizedBox(
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(movie.title, style:textStyles.titleMedium),
                const SizedBox(height:5),
                Text(movie.overview, style:textStyles.bodySmall, maxLines: 3, overflow: TextOverflow.ellipsis),
              ]
            ),
          )
        ]
      )
    );
  }
}