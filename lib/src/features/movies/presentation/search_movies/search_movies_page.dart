import 'package:elemes_id_test/src/constants/constants.dart';
import 'package:elemes_id_test/src/features/movies/presentation/search_movies/controllers/result_search_text.dart';
import 'package:elemes_id_test/src/features/movies/presentation/search_movies/controllers/search_movies_constoller.dart';
import 'package:elemes_id_test/src/features/movies/presentation/search_movies/widgets/search_field.dart';
import 'package:elemes_id_test/src/features/movies/presentation/search_movies/widgets/search_movies_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchMoviesPage extends StatelessWidget {
  const SearchMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkGreen,
      appBar: AppBar(
        title: Text(
          'Search Movies',
          style: AppThemes.headline3,
        ),
        backgroundColor: AppThemes.darkGreen,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h20,
              Row(
                children: [
                  Expanded(
                    child: Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        return SearchField(
                          hintText: 'Search your movies',
                          autofocus: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              ref
                                  .read(searchMoviesControllerProvider.notifier)
                                  .searchMovies(query: value);
                            }
                            ref
                                .read(
                                    resultSearchTextControllerProvider.notifier)
                                .search(name: value);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Gap.h40,
              Consumer(
                builder: (context, ref, child) {
                  final result = ref.watch(resultSearchTextControllerProvider);
                  if (result.isNotEmpty) {
                    return Text(
                      'Results for "$result"',
                      style: AppThemes.headline3,
                    );
                  }
                  return Container();
                },
              ),
              Gap.h20,
              const SearchMoviesListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
