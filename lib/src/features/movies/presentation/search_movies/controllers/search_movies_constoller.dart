import 'package:elemes_id_test/src/features/movies/application/movies_service.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchMoviesController extends StateNotifier<AsyncValue<MoviesList?>> {
  SearchMoviesController({required this.moviesService})
      : super(const AsyncData(null));

  final MoviesService moviesService;

  Future<void> searchMovies({required String query}) async {
    state = const AsyncLoading();
    final result = await moviesService.getMoviesSearch(query: query);
    result.when(
      success: (data) => state = AsyncData(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final searchMoviesControllerProvider = StateNotifierProvider.autoDispose<
    SearchMoviesController, AsyncValue<MoviesList?>>(
  (ref) =>
      SearchMoviesController(moviesService: ref.watch(moviesServiceProvider)),
);
