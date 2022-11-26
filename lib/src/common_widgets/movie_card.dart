import 'package:elemes_id_test/src/constants/keys.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies.dart';
import 'package:elemes_id_test/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movies}) : super(key: key);

  final Movies movies;
  static String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          context.pushNamed(
            Routes.detailMovies.name,
            extra: Extras(
              extras: {
                Keys.moviesId: movies.id,
              },
            ),
          );
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: CachedNetworkImage(
            imageUrl: '$baseImageUrl${movies.posterPath}',
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
