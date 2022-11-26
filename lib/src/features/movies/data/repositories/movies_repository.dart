import 'package:elemes_id_test/src/exceptions/network_exceptions.dart';
import 'package:elemes_id_test/src/features/movies/data/responses/movies_detail_response.dart';
import 'package:elemes_id_test/src/features/movies/data/responses/movies_list_response.dart';
import 'package:elemes_id_test/src/features/movies/data/responses/movies_search_response.dart';
import 'package:elemes_id_test/src/services/network/api_result.dart';
import 'package:elemes_id_test/src/services/network/dio_client.dart';
import 'package:elemes_id_test/src/services/network/endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesRepository {
  final DioClient _dioClient;

  MoviesRepository(this._dioClient);

  static const apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';

  Future<ApiResult<MoviesListResponse>> getNowPlayingMovies() async {
    try {
      final response =
          await _dioClient.get(Endpoints.getNowPlayingMovies + apiKey);
      return ApiResult.success(MoviesListResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }

  Future<ApiResult<MoviesListResponse>> getPopularMovies() async {
    try {
      final response =
          await _dioClient.get(Endpoints.getPopularMovies + apiKey);
      return ApiResult.success(MoviesListResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }

  Future<ApiResult<MoviesListResponse>> getTopRatedMovies() async {
    try {
      final response =
          await _dioClient.get(Endpoints.getTopRatedMovies + apiKey);
      return ApiResult.success(MoviesListResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }

  Future<ApiResult<MoviesListResponse>> getUpcomingMovies() async {
    try {
      final response =
          await _dioClient.get(Endpoints.getUpcomingMovies + apiKey);
      return ApiResult.success(MoviesListResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }

  Future<ApiResult<MoviesDetailResponse>> getDetailMovie(
      {required int id}) async {
    try {
      final response =
          await _dioClient.get("${Endpoints.getDetailMovie}$id?$apiKey");
      return ApiResult.success(MoviesDetailResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }

  Future<ApiResult<MoviesSearchResponse>> getMoviesSearch(
      {required String query}) async {
    try {
      final response = await _dioClient.get(
        "${Endpoints.movieSearch}$apiKey&query=$query",
        queryParameters: {
          'q': query,
        },
      );
      return ApiResult.success(MoviesSearchResponse.fromJson(response));
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }
}

final moviesRepositoryProvider = Provider<MoviesRepository>((ref) {
  return MoviesRepository(ref.read(dioClientProvider));
});
