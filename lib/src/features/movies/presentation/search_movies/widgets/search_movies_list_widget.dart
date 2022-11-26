import 'package:elemes_id_test/src/common_widgets/common_widgets.dart';
import 'package:elemes_id_test/src/common_widgets/movie_card_list.dart';
import 'package:elemes_id_test/src/constants/constants.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_list.dart';
import 'package:elemes_id_test/src/features/movies/presentation/search_movies/controllers/result_search_text.dart';
import 'package:elemes_id_test/src/features/movies/presentation/search_movies/controllers/search_movies_constoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchMoviesListWidget extends ConsumerWidget {
  const SearchMoviesListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<MoviesList?> movies =
        ref.watch(searchMoviesControllerProvider);
    final String result = ref.watch(resultSearchTextControllerProvider);
    if (result.isEmpty) {
      return Center(
        child: Text(
          'Search your movies here..',
          style: AppThemes.headline1,
        ),
      );
    }
    return AsyncValueWidget<MoviesList?>(
      value: movies,
      data: (value) {
        if (value == null) {
          return Center(
            child: Text(
              'Movies Not Found',
              style: AppThemes.headline1,
            ),
          );
        }
        if (value.movies.isEmpty) {
          return Center(
            child: Text(
              'Movies Not Found',
              style: AppThemes.headline1,
            ),
          );
        }
        return ListView.builder(
          itemCount: value.movies.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final movies = value.movies[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: Sizes.p20),
              child: MovieCardListTile(
                movies: movies,
              ),
            );
          },
        );
      },
    );
  }
}
