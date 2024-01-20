import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gen_move/app/modules/home/widgets/movie_card.dart';
import 'package:gen_move/app/modules/movie/presentation/controller/movie_controller.dart';
import 'package:gen_move/app/modules/movie/presentation/mobx/movie_store.dart';
import 'package:gen_move/app/shared/helpers/snack_helper.dart';
import 'package:gen_move/app/shared/styles/app_edge_insets.dart';
import 'package:gen_move/app/shared/styles/app_text_styles.dart';
import 'package:gen_move/app/shared/widgets/background/background_widget.dart';
import 'package:gen_move/app/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.controller,
  });
  final MovieController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MovieController controller;
  late MovieStore movieStore;

  late ReactionDisposer _errorDisposer;
  late ReactionDisposer _moviesDisposer;

  @override
  void initState() {
    controller = widget.controller;
    movieStore = controller.movieStore;

    _errorDisposer = reaction((p0) => movieStore.isError, (p0) {
      if (movieStore.isError) {
        controller.stError(false);
        SnackHelper.showSnackInformation(
          movieStore.errorMessage,
          Colors.red,
          context,
        );
      }
    });

    _moviesDisposer = autorun(
      (p0) async => await controller.getMovies(),
    );

    super.initState();
  }

  @override
  void dispose() {
    _errorDisposer.call();
    _moviesDisposer.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Observer(builder: (context) {
      return BackgroundWidget(
        child: ScaffoldPrimary(
          isLoading: movieStore.isLoading,
          footer: Container(
            width: double.infinity,
            height: size.height * 0.3,
            padding: AppEdgeInsets.all5,
            margin: AppEdgeInsets.all20,
            child: movieStore.movies.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: AppEdgeInsets.b10,
                        child: Text(
                          'LINHA DO TEMPO',
                          style: AppTextStyles.simpleWhiteBold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieStore.movies.length,
                          itemBuilder: (context, index) {
                            final movie = movieStore.movies[index];
                            return MovieCard(
                              movie: movie,
                              size: size,
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      movieStore.isLoading
                          ? 'Carregando...'
                          : 'Nenhum filme encontrado',
                      style: AppTextStyles.simpleWhite,
                    ),
                  ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: movieStore.movies.isNotEmpty,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text('MARVEL\nCINEMATIC\nUNIVERSE',
                      style: AppTextStyles.headingBold),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
