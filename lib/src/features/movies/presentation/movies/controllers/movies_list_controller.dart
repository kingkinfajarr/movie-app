import 'package:elemes_id_test/src/features/movies/application/movies_service.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesListController extends StateNotifier<AsyncValue<MoviesList>> {
  MoviesListController({required this.moviesService})
      : super(AsyncData<MoviesList>(MoviesList()));

  final MoviesService moviesService;

  Future<void> getNowPlayingMovies() async {
    state = const AsyncValue.loading();
    final result = await moviesService.getNowPlayingMovies();
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final moviesListControllerProvider = StateNotifierProvider
    .autoDispose<MoviesListController, AsyncValue<MoviesList>>((ref) =>
        MoviesListController(moviesService: ref.watch(moviesServiceProvider)));
