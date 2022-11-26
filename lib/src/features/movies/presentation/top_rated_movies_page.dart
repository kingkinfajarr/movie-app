import 'package:elemes_id_test/src/common_widgets/common_widgets.dart';
import 'package:elemes_id_test/src/common_widgets/movie_card_list.dart';
import 'package:elemes_id_test/src/constants/constants.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_list.dart';
import 'package:elemes_id_test/src/features/movies/presentation/movies/controllers/top_rated_movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopRatedMoviesPage extends ConsumerStatefulWidget {
  const TopRatedMoviesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends ConsumerState<TopRatedMoviesPage> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref.read(topRatedMovieControllerProvider.notifier).getTopRatedMovies();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<MoviesList> movies =
        ref.watch(topRatedMovieControllerProvider);
    return Scaffold(
      backgroundColor: AppThemes.darkGreen,
      appBar: AppBar(
        title: const Text(
          'Top Rated Movie',
        ),
        backgroundColor: AppThemes.darkGreen,
      ),
      body: AsyncValueWidget<MoviesList>(
        value: movies,
        data: (value) {
          if (value.movies.isEmpty) {
            return const Center(
              child: Text('Error'),
            );
          }
          return Container(
            margin: const EdgeInsets.all(Sizes.p20),
            child: ListView.builder(
              itemCount: value.movies.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final movie = value.movies[index];
                return MovieCardListTile(
                  movies: movie,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
