import 'package:elemes_id_test/src/constants/constants.dart';
import 'package:elemes_id_test/src/features/movies/presentation/movies/widgets/movies_list_widget.dart';
import 'package:elemes_id_test/src/features/movies/presentation/movies/widgets/popular_movie_widget.dart';
import 'package:elemes_id_test/src/features/movies/presentation/movies/widgets/top_rated_movie_widget.dart';
import 'package:elemes_id_test/src/features/movies/presentation/movies/widgets/upcoming_movie_widget.dart';
import 'package:elemes_id_test/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkGreen,
      appBar: AppBar(
        title: Text(
          'Yuk Nonton',
          style: AppThemes.headline1.copyWith(
            decoration: TextDecoration.underline,
            decorationThickness: 2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Sizes.p16),
            child: GestureDetector(
                onTap: () => context.pushNamed(Routes.searchMovies.name),
                child: const Icon(Icons.search)),
          ),
        ],
        backgroundColor: AppThemes.darkGreen,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h20,
              _buildSubHeading(
                title: 'Movie Now Playing',
                onTap: () => context.pushNamed(Routes.nowPlayingMovies.name),
              ),
              Gap.h20,
              const MoviesListWidget(),
              Gap.h20,
              _buildSubHeading(
                title: 'Popular Movies',
                onTap: () => context.pushNamed(Routes.popularMovies.name),
              ),
              Gap.h20,
              const PopularMovieWidget(),
              Gap.h20,
              _buildSubHeading(
                title: 'Top Rated Movies',
                onTap: () => context.pushNamed(Routes.topRatedMovies.name),
              ),
              Gap.h20,
              const TopRatedMovieWidget(),
              Gap.h20,
              _buildSubHeading(
                title: 'Upcoming Movies',
                onTap: () => context.pushNamed(Routes.upcomingMovies.name),
              ),
              Gap.h20,
              const UpcomingMovieWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppThemes.headline2,
        ),
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'See More',
                style: AppThemes.text1,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppThemes.white,
                size: Sizes.p12,
              )
            ],
          ),
        ),
      ],
    );
  }
}
