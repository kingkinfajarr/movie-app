import 'package:elemes_id_test/src/features/movies/data/responses/movies_detail_response.dart';
import 'package:elemes_id_test/src/features/movies/data/responses/movies_list_response.dart';
import 'package:elemes_id_test/src/features/movies/data/responses/movies_search_response.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_detail.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_list.dart';
import 'package:elemes_id_test/src/services/network/api_result.dart';

class MoviesMapper {
  static ApiResult<MoviesList> mapToMoviesList(
      ApiResult<MoviesListResponse> response) {
    return response.when(
      success: (data) {
        return ApiResult.success(
          MoviesList(
            movies: data.movies
                ?.map(
                  (item) => Movies(
                    adult: item.adult,
                    backdropPath: item.backdropPath,
                    genreIds: item.genreIds,
                    id: item.id,
                    originalTitle: item.originalTitle,
                    overview: item.overview,
                    popularity: item.popularity,
                    posterPath: item.posterPath,
                    releaseDate: item.releaseDate,
                    title: item.title,
                    video: item.video,
                    voteAverage: item.voteAverage,
                    voteCount: item.voteCount,
                  ),
                )
                .toList(),
          ),
        );
      },
      failure: (error, stacktrace) {
        return ApiResult.failure(error, stacktrace);
      },
    );
  }

  static ApiResult<MoviesDetail> mapToMoviesDetail(
      ApiResult<MoviesDetailResponse> response) {
    return response.when(
      success: (data) {
        final moviesDetail = data.moviesDetail;
        return ApiResult.success(
          MoviesDetail(
            adult: moviesDetail?.adult,
            backdropPath: moviesDetail?.backdropPath,
            budget: moviesDetail?.budget,
            genres: moviesDetail?.genres
                ?.map((genre) => Genre(
                      id: genre.id,
                      name: genre.name,
                    ))
                .toList(),
            homepage: moviesDetail?.homepage,
            id: moviesDetail?.id,
            imdbId: moviesDetail?.imdbId,
            originalLanguage: moviesDetail?.originalLanguage,
            originalTitle: moviesDetail?.originalTitle,
            overview: moviesDetail?.overview,
            popularity: moviesDetail?.popularity,
            posterPath: moviesDetail?.posterPath,
            releaseDate: moviesDetail?.releaseDate,
            revenue: moviesDetail?.revenue,
            runtime: moviesDetail?.runtime,
            status: moviesDetail?.status,
            tagline: moviesDetail?.tagline,
            title: moviesDetail?.title,
            video: moviesDetail?.video,
            voteAverage: moviesDetail?.voteAverage,
            voteCount: moviesDetail?.voteCount,
          ),
        );
      },
      failure: (error, stacktrace) {
        return ApiResult.failure(error, stacktrace);
      },
    );
  }

  static ApiResult<MoviesList> mapToMoviesSearch(
      ApiResult<MoviesSearchResponse> response) {
    return response.when(
      success: (data) {
        return ApiResult.success(
          MoviesList(
            movies: data.movies
                ?.map(
                  (item) => Movies(
                    adult: item.adult,
                    backdropPath: item.backdropPath,
                    genreIds: item.genreIds,
                    id: item.id,
                    originalTitle: item.originalTitle,
                    overview: item.overview,
                    popularity: item.popularity,
                    posterPath: item.posterPath,
                    releaseDate: item.releaseDate,
                    title: item.title,
                    video: item.video,
                    voteAverage: item.voteAverage,
                    voteCount: item.voteCount,
                  ),
                )
                .toList(),
          ),
        );
      },
      failure: (error, stacktrace) {
        return ApiResult.failure(error, stacktrace);
      },
    );
  }
}
