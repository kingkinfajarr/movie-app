import 'package:elemes_id_test/src/features/movies/application/movies_service.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularMovieController extends StateNotifier<AsyncValue<MoviesList>> {
  PopularMovieController({required this.moviesService})
      : super(AsyncData<MoviesList>(MoviesList()));

  final MoviesService moviesService;

  Future<void> getPopularMovies() async {
    state = const AsyncValue.loading();
    final result = await moviesService.getPopularMovies();
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final popularMovieControllerProvider = StateNotifierProvider.autoDispose<
        PopularMovieController, AsyncValue<MoviesList>>(
    (ref) => PopularMovieController(
        moviesService: ref.watch(moviesServiceProvider)));
