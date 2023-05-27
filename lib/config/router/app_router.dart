
import 'package:flutter_cinemapedia/presentation/screens/screens.dart';
import 'package:flutter_cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes:[
    //* Implement rutas Padre/Hijo
    // GoRoute(
    //   path: '/',
    //   name: HomeScreen.name,
    //   builder: (context, state) => const HomeScreen(childView: HomeView()),
    //   routes:[
    //     GoRoute(
    //       path: 'movies/:id',
    //       name: MovieScreen.name,
    //       builder: (context, state) {
    //         final movieId = state.params['id'] ?? 'no-id';
    //         return MovieScreen(movieId: movieId);
    //       },
    //     ),
    //   ]
    // ),
    //* Implement page routes with Shell router
    ShellRoute(
      builder:(context, state, child){
        return HomeScreen(childView: child);
      },
      routes:[
        GoRoute(
          path: '/',
          builder:(context,state) => const HomeView(),
          routes:[
            GoRoute(
              path: 'movies/:id',
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.params['id'] ?? 'no-id';
                return MovieScreen(movieId: movieId);
              },
            ),
          ]
        ),
        GoRoute(
          path: '/favorites',
          builder:(context,state) => const FavoritesView(),
        ),
      ]
    )

  ]
);