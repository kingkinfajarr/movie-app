import 'package:elemes_id_test/src/features/movies/application/movies_service.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopRatedMoviesController extends StateNotifier<AsyncValue<MoviesList>> {
  TopRatedMoviesController({required this.moviesService})
      : super(AsyncData<MoviesList>(MoviesList()));

  final MoviesService moviesService;

  Future<void> getTopRatedMovies() async {
    state = const AsyncValue.loading();
    final result = await moviesService.getTopRatedMovies();
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final topRatedMovieControllerProvider = StateNotifierProvider.autoDispose<
        TopRatedMoviesController, AsyncValue<MoviesList>>(
    (ref) => TopRatedMoviesController(
        moviesService: ref.watch(moviesServiceProvider)));
