import 'package:elemes_id_test/src/features/movies/application/movies_service.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailMoviesController extends StateNotifier<AsyncValue<MoviesDetail>> {
  DetailMoviesController({required this.moviesService})
      : super(const AsyncLoading());

  final MoviesService moviesService;

  Future<void> getMoviesById({required int id}) async {
    state = const AsyncValue.loading();
    final result = await moviesService.getDetailMovies(id: id);
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final detailMoviesControllerProvider = StateNotifierProvider.autoDispose<
        DetailMoviesController, AsyncValue<MoviesDetail>>(
    (ref) => DetailMoviesController(
        moviesService: ref.watch(moviesServiceProvider)));
