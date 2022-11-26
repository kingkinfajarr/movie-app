import 'dart:convert';

import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movies({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  })  : adult = adult ?? false,
        backdropPath = backdropPath ?? '',
        genreIds = genreIds ?? [],
        id = id ?? 1,
        originalTitle = originalTitle ?? '',
        overview = overview ?? '',
        popularity = popularity ?? 0.0,
        posterPath = posterPath ?? '',
        releaseDate = releaseDate ?? '',
        title = title ?? '',
        video = video ?? false,
        voteAverage = voteAverage ?? 0.0,
        voteCount = voteCount ?? 0;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      adult: map['adult'] as bool,
      backdropPath: map['backdrop_path'] as String,
      genreIds: map['genre_ids'] as List<int>,
      id: map['id'] as int,
      originalTitle: map['original_title'] as String,
      overview: map['overview'] as String,
      popularity: map['popularity'] as double,
      posterPath: map['poster_path'] as String,
      releaseDate: map['release_date'] as String,
      title: map['title'] as String,
      video: map['video'] as bool,
      voteAverage: map['vote_average'] as double,
      voteCount: map['vote_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movies.fromJson(String source) =>
      Movies.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
