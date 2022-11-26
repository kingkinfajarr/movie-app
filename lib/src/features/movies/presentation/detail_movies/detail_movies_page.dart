import 'package:cached_network_image/cached_network_image.dart';
import 'package:elemes_id_test/src/common_widgets/common_widgets.dart';
import 'package:elemes_id_test/src/constants/constants.dart';
import 'package:elemes_id_test/src/features/movies/domain/movies_detail.dart';
import 'package:elemes_id_test/src/features/movies/presentation/detail_movies/controllers/detail_movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailMoviesPage extends ConsumerStatefulWidget {
  final int moviesId;
  const DetailMoviesPage({super.key, required this.moviesId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailMoviesPageState();
}

class _DetailMoviesPageState extends ConsumerState<DetailMoviesPage> {
  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref
          .read(detailMoviesControllerProvider.notifier)
          .getMoviesById(id: widget.moviesId);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final detailMovies = ref.watch(detailMoviesControllerProvider);
    return Scaffold(
      backgroundColor: AppThemes.darkGreen,
      appBar: AppBar(
        title: const Text('Detail Page'),
        backgroundColor: AppThemes.darkGreen,
      ),
      body: SafeArea(
        child: Center(
          child: AsyncValueWidget<MoviesDetail>(
            value: detailMovies,
            data: (detailEmployees) {
              return _content(detailEmployees);
            },
          ),
        ),
      ),
    );
  }

  Widget _content(MoviesDetail detailMovies) {
    String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 500,
          child: CachedNetworkImage(
            imageUrl: '$baseImageUrl${detailMovies.posterPath}',
            fit: BoxFit.cover,
          ),
        ),
        Gap.h16,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detailMovies.title,
                          style: AppThemes.headline1,
                        ),
                        Text(
                          detailMovies.genres
                              .map((item) => item.name)
                              .toString(),
                          style: AppThemes.text1,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppThemes.orange,
                      ),
                      Gap.w4,
                      Text(
                        detailMovies.voteAverage.toString(),
                        style: AppThemes.text1,
                      )
                    ],
                  )
                ],
              ),
              Gap.h20,
              Text(
                detailMovies.overview,
                style: AppThemes.text1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
