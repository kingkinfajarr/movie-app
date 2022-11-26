import 'package:elemes_id_test/src/common_widgets/common_widgets.dart';
import 'package:elemes_id_test/src/common_widgets/movie_card.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_list.dart';
import 'package:elemes_id_test/src/features/movies/presentation/movies/controllers/upcoming_movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpcomingMovieWidget extends ConsumerStatefulWidget {
  const UpcomingMovieWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpcomingMovieWidgetState();
}

class _UpcomingMovieWidgetState extends ConsumerState<UpcomingMovieWidget> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref.read(upcomingMovieControllerProvider.notifier).getTopRatedMovies();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<MoviesList> movies =
        ref.watch(upcomingMovieControllerProvider);

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
