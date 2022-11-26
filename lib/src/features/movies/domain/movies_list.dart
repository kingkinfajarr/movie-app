import 'package:elemes_id_test/src/features/movies/domain/movies.dart';
import 'package:equatable/equatable.dart';

class MoviesList extends Equatable {
  final List<Movies> movies;

  MoviesList({
    List<Movies>? movies,
  }) : movies = movies ?? [];

  @override
  List<Object?> get props => [movies];
}
