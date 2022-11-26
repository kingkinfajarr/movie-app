import 'package:elemes_id_test/splash_screen.dart';
import 'package:elemes_id_test/src/constants/keys.dart';
import 'package:elemes_id_test/src/features/movies/presentation/detail_movies/detail_movies_page.dart';
import 'package:elemes_id_test/src/features/movies/presentation/movies_page.dart';
import 'package:elemes_id_test/src/features/movies/presentation/now_playing_movies_page.dart';
import 'package:elemes_id_test/src/features/movies/presentation/popular_movies_page.dart';
import 'package:elemes_id_test/src/features/movies/presentation/search_movies/search_movies_page.dart';
import 'package:elemes_id_test/src/features/movies/presentation/top_rated_movies_page.dart';
import 'package:elemes_id_test/src/features/movies/presentation/upcoming_movies_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routing.dart';

enum Routes {
  splash,
  home,
  nowPlayingMovies,
  popularMovies,
  topRatedMovies,
  upcomingMovies,
  detailMovies,
  searchMovies,
}

final goRouter = GoRouter(
  navigatorKey: navigatorKey,
  debugLogDiagnostics: true,
  urlPathStrategy: UrlPathStrategy.path,
  initialLocation: '/',
  errorPageBuilder: (context, state) => _navigate(
    context,
    state,
    ErrorPage(
      error: state.error,
    ),
  ),
  routes: [
    GoRoute(
      path: '/',
      name: Routes.splash.name,
      pageBuilder: (context, state) => _navigate(
        context,
        state,
        const SplashScreen(),
      ),
      routes: [
        GoRoute(
          path: 'home',
          name: Routes.home.name,
          pageBuilder: (context, state) {
            return _navigate(context, state, const MoviesPage());
          },
        ),
        GoRoute(
          path: 'now-playing-movies',
          name: Routes.nowPlayingMovies.name,
          pageBuilder: (context, state) {
            return _navigate(context, state, const NowPlayingMoviesPage());
          },
        ),
        GoRoute(
          path: 'popular-movie',
          name: Routes.popularMovies.name,
          pageBuilder: (context, state) {
            return _navigate(context, state, const PopularMoviesPage());
          },
        ),
        GoRoute(
          path: 'top-rated-movie',
          name: Routes.topRatedMovies.name,
          pageBuilder: (context, state) {
            return _navigate(context, state, const TopRatedMoviesPage());
          },
        ),
        GoRoute(
          path: 'upcoming-movie',
          name: Routes.upcomingMovies.name,
          pageBuilder: (context, state) {
            return _navigate(context, state, const UpcomingMoviesPage());
          },
        ),
        GoRoute(
          path: 'search-movie',
          name: Routes.searchMovies.name,
          pageBuilder: (context, state) {
            return _navigate(context, state, const SearchMoviesPage());
          },
        ),
        GoRoute(
          path: 'detail-movies',
          name: Routes.detailMovies.name,
          pageBuilder: (context, state) {
            final extras = (state.extra as Extras).extras;
            final moviesId = extras[Keys.moviesId];

            return _navigate(
              context,
              state,
              DetailMoviesPage(
                moviesId: moviesId,
              ),
            );
          },
        ),
      ],
    ),
  ],
);

Page<void> _navigate(BuildContext context, GoRouterState state, Widget screen) {
  return MaterialPage<void>(
    key: state.pageKey,
    restorationId: state.pageKey.value,
    child: screen,
  );
}
