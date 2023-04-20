import 'package:flutter/material.dart';
import 'package:flutter_cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }
  
  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(upcomingMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRated = ref.watch(topRatedMoviesProvider);

    return Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title:CustomAppBar()
            ),
          ),
          SliverList(
            delegate:SliverChildBuilderDelegate(
              (context, index){
                return Column(
                  children:[
                    // const CustomAppBar(),
                    MoviesSlideshow(movies: slideShowMovies),
                    MovieHorizontalListview(
                      movies: nowPlayingMovies, 
                      title: 'En cines',
                      subTitle: 'Lunes 20',
                      loadNextPage: (){
                        ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                      },
                    ),
                    MovieHorizontalListview(
                      movies: upcomingMovies, 
                      title: 'Próximamente',
                      subTitle: 'En este mes',
                      loadNextPage: (){
                        ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                      },
                    ),
                    MovieHorizontalListview(
                      movies: popularMovies, 
                      title: 'Populares',
                      subTitle: 'Actuales',
                      loadNextPage: (){
                        ref.read(popularMoviesProvider.notifier).loadNextPage();
                      },
                    ),
                    MovieHorizontalListview(
                      movies: topRated, 
                      title: 'Mejor calificadas',
                      subTitle: 'Todos los tiempos',
                      loadNextPage: (){
                        ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                      },
                    ),
                    const SizedBox(height:10)
                  ]
                );
              },
              childCount: 1,
            )
          )
        ],
      ),
    );
  }
}