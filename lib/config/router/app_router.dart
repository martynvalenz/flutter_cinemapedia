
import 'package:flutter_cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes:[
    //* Implement rutas Padre/Hijo
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state){
        final pageIndex = int.parse(state.params['page'] ?? '0');
        if(pageIndex > 3 || pageIndex < 0) context.go('/home/0');
        return HomeScreen(pageIndex:pageIndex);
      },
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
      path: '/',
      redirect: (_, __) => '/home/0',
    )
    //* Implement page routes with Shell router
    // ShellRoute(
    //   builder:(context, state, child){
    //     return HomeScreen(childView: child);
    //   },
    //   routes:[
    //     GoRoute(
    //       path: '/',
    //       builder:(context,state) => const HomeView(),
    //       routes:[
    //         GoRoute(
    //           path: 'movies/:id',
    //           name: MovieScreen.name,
    //           builder: (context, state) {
    //             final movieId = state.params['id'] ?? 'no-id';
    //             return MovieScreen(movieId: movieId);
    //           },
    //         ),
    //       ]
    //     ),
    //     GoRoute(
    //       path: '/favorites',
    //       builder:(context,state) => const FavoritesView(),
    //     ),
    //   ]
    // )

  ]
);