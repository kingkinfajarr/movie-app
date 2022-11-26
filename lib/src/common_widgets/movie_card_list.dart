import 'package:cached_network_image/cached_network_image.dart';
import 'package:elemes_id_test/src/constants/app_themes.dart';
import 'package:elemes_id_test/src/constants/keys.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies.dart';
import 'package:elemes_id_test/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieCardListTile extends StatelessWidget {
  const MovieCardListTile({Key? key, required this.movies}) : super(key: key);

  final Movies movies;
  static String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
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
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Card(
              color: AppThemes.grey,
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16 + 80 + 16,
                  bottom: 8,
                  right: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movies.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppThemes.headline2,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      movies.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppThemes.text2,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${movies.posterPath}',
                  width: 80,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
