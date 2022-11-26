import 'package:elemes_id_test/src/common_widgets/common_widgets.dart';
import 'package:elemes_id_test/src/common_widgets/movie_card.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_list.dart';
import 'package:elemes_id_test/src/features/movies/presentation/movies/controllers/movies_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesListWidget extends ConsumerStatefulWidget {
  const MoviesListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MoviesListWidgetState();
}

class _MoviesListWidgetState extends ConsumerState<MoviesListWidget> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref.read(moviesListControllerProvider.notifier).getNowPlayingMovies();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<MoviesList> movies =
        ref.watch(moviesListControllerProvider);

    return AsyncValueWidget<MoviesList>(
      value: movies,
      data: (value) {
        if (value.movies.isEmpty) {
          return const Center(
            child: Text('Error'),
          );
        }
        return SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: value.movies.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final movie = value.movies[index];
              return MovieCard(
                movies: movie,
              );
            },
          ),
        );
      },
    );
  }
}
