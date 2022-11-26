import 'package:elemes_id_test/src/features/movies/application/movies_mapper.dart';
import 'package:elemes_id_test/src/features/movies/data/repositories/movies_repository.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_detail.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_list.dart';
import 'package:elemes_id_test/src/services/network/api_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesService {
  final Ref ref;

  MoviesService({required this.ref});

  Future<ApiResult<MoviesList>> getNowPlayingMovies() async {
    final nowPlayingMovies =
        await ref.read(moviesRepositoryProvider).getNowPlayingMovies();
    return MoviesMapper.mapToMoviesList(nowPlayingMovies);
  }

  Future<ApiResult<MoviesList>> getPopularMovies() async {
    final popularMovies =
        await ref.read(moviesRepositoryProvider).getPopularMovies();
    return MoviesMapper.mapToMoviesList(popularMovies);
  }

  Future<ApiResult<MoviesList>> getTopRatedMovies() async {
    final topRatedMovies =
        await ref.read(moviesRepositoryProvider).getTopRatedMovies();
    return MoviesMapper.mapToMoviesList(topRatedMovies);
  }

  Future<ApiResult<MoviesList>> getUpcomingMovies() async {
    final topRatedMovies =
        await ref.read(moviesRepositoryProvider).getUpcomingMovies();
    return MoviesMapper.mapToMoviesList(topRatedMovies);
  }

  Future<ApiResult<MoviesDetail>> getDetailMovies({required int id}) async {
    final detailMovies =
        await ref.read(moviesRepositoryProvider).getDetailMovie(id: id);
    return MoviesMapper.mapToMoviesDetail(detailMovies);
  }

  Future<ApiResult<MoviesList>> getMoviesSearch({required String query}) async {
    final moviesSearch =
        await ref.read(moviesRepositoryProvider).getMoviesSearch(query: query);
    return MoviesMapper.mapToMoviesSearch(moviesSearch);
  }
}

final moviesServiceProvider = Provider<MoviesService>((ref) {
  return MoviesService(ref: ref);
});
