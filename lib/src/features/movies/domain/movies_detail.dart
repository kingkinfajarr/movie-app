import 'package:equatable/equatable.dart';

class MoviesDetail extends Equatable {
  final bool adult;
  final String? backdropPath;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MoviesDetail({
    bool? adult,
    String? backdropPath,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    int? revenue,
    int? runtime,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  })  : adult = adult ?? false,
        backdropPath = backdropPath ?? '',
        budget = budget ?? 0,
        genres = genres ?? [],
        homepage = homepage ?? '',
        id = id ?? 0,
        imdbId = imdbId ?? '',
        originalLanguage = originalLanguage ?? '',
        originalTitle = originalTitle ?? '',
        overview = overview ?? '',
        popularity = popularity ?? 0.0,
        posterPath = posterPath ?? '',
        releaseDate = releaseDate ?? '',
        revenue = revenue ?? 0,
        runtime = runtime ?? 0,
        status = status ?? '',
        tagline = tagline ?? '',
        title = title ?? '',
        video = video ?? false,
        voteAverage = voteAverage ?? 0.0,
        voteCount = voteCount ?? 0;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        revenue,
        runtime,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}

class Genre extends Equatable {
  final int id;
  final String name;

  const Genre({
    int? id,
    String? name,
  })  : id = id ?? 0,
        name = name ?? '';

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
