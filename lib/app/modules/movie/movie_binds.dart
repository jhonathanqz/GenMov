import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_move/app/core/constants/app_token.dart';
import 'package:gen_move/app/modules/movie/data/provider/movie_provider_impl.dart';
import 'package:gen_move/app/modules/movie/domain/usecase/get_movies_usecase.dart';
import 'package:gen_move/app/modules/movie/domain/usecase/get_popular_movies_usecase.dart';
import 'package:gen_move/app/modules/movie/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:gen_move/app/modules/movie/domain/usecase/search_movies_usecase.dart';
import 'package:gen_move/app/modules/movie/presentation/controller/movie_controller.dart';

import 'infrastructure/repositories/movie_repository_impl.dart';
import 'presentation/mobx/movie_store.dart';

class MovieBinds {
  static List<Bind> get provider => [
        Bind.factory(
          (i) => MovieProviderImpl(basePath: AppToken.urlBase),
          export: true,
        ),
      ];

  static List<Bind> get repository => [
        Bind.factory(
          (i) => MovieRepositoryImpl(movieProvider: i()),
          export: true,
        ),
      ];

  static List<Bind> get usecase => [
        Bind.factory(
          (i) => GetMoviesUsecase(movieRepository: i()),
          export: true,
        ),
        Bind.factory(
          (i) => GetPopularMoviesUsecase(movieRepository: i()),
          export: true,
        ),
        Bind.factory(
          (i) => GetTopRatedMoviesUsecase(movieRepository: i()),
          export: true,
        ),
        Bind.factory(
          (i) => SearchMoviesUsecase(movieRepository: i()),
          export: true,
        ),
      ];

  static List<Bind> get store => [
        Bind.lazySingleton(
          (i) => MovieStore(
            getMoviesUsecase: i(),
            getTopRatedMoviesUsecase: i(),
            getPopularMoviesUsecase: i(),
            searchMoviesUsecase: i(),
          ),
          export: true,
        ),
      ];

  static List<Bind> get controllers => [
        Bind.factory(
          (i) => MovieController(movieStore: i()),
          export: true,
        ),
      ];

  static List<Bind> get all => [
        ...provider,
        ...repository,
        ...usecase,
        ...store,
        ...controllers,
      ];
}
