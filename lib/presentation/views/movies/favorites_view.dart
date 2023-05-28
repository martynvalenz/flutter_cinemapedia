import 'package:flutter/material.dart';
import 'package:flutter_cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  void loadNextPage() async{
    if(isLoading || isLastPage) return;
    isLoading = true;
    
    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if(movies.isEmpty){
      isLastPage = true;
    }
  }
    

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if(favoriteMovies.isEmpty){
      final colors = Theme.of(context).colorScheme;
      return Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 100, color:colors.primary),
            const SizedBox(height: 10),
            Text(
              'Ohhh no!!!',
              style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:colors.primary)
            ),
            const Text(
              'No hay pelis, ptm!',
              style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.black54)
            ),
            const SizedBox(height:20),
            FilledButton.tonal(
              onPressed: () => context.push('/home/0'),
              child: const Text('Agregar pelis')
            )
          ]
        ) 
      );
    }

    return Scaffold(
      body: MovieMasonry(
        loadNextPage: loadNextPage,
        movies: favoriteMovies
      )
    );
  }
}