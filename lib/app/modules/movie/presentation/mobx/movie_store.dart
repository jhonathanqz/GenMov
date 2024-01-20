import 'package:gen_move/app/modules/movie/domain/usecase/get_movies_usecase.dart';
import 'package:gen_move/app/modules/movie/domain/usecase/get_popular_movies_usecase.dart';
import 'package:gen_move/app/modules/movie/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:gen_move/app/modules/movie/domain/usecase/search_movies_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/entities/usecase.dart';
import '../../domain/entities/movie.dart';

part 'movie_store.g.dart';

class MovieStore = MovieStoreBase with _$MovieStore;

abstract class MovieStoreBase with Store {
  final GetMoviesUsecase _getMoviesUsecase;
  final GetTopRatedMoviesUsecase _getTopRatedMoviesUsecase;
  final GetPopularMoviesUsecase _getPopularMoviesUsecase;
  final SearchMoviesUsecase _searchMoviesUsecase;

  MovieStoreBase({
    required GetMoviesUsecase getMoviesUsecase,
    required GetTopRatedMoviesUsecase getTopRatedMoviesUsecase,
    required GetPopularMoviesUsecase getPopularMoviesUsecase,
    required SearchMoviesUsecase searchMoviesUsecase,
  })  : _getMoviesUsecase = getMoviesUsecase,
        _getTopRatedMoviesUsecase = getTopRatedMoviesUsecase,
        _getPopularMoviesUsecase = getPopularMoviesUsecase,
        _searchMoviesUsecase = searchMoviesUsecase;

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  String errorMessage = '';

  @action
  void stError(bool value) => isError = value;

  @observable
  List<Movie> movies = [];

  @action
  Future<void> getMovies() async {
    isLoading = true;
    isError = false;
    errorMessage = '';
    try {
      movies = [];
      final response = await _getMoviesUsecase.call(NoParams());
      await Future.delayed(const Duration(seconds: 5));
      movies.addAll(response);
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> getTopRatedMovies() async {
    isLoading = true;
    isError = false;
    errorMessage = '';
    try {
      movies = await _getTopRatedMoviesUsecase.call(NoParams());
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> getPopularMovies() async {
    isLoading = true;
    isError = false;
    errorMessage = '';
    try {
      movies = await _getPopularMoviesUsecase.call(NoParams());
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> searchMovies(String query) async {
    isLoading = true;
    isError = false;
    errorMessage = '';
    try {
      movies = await _searchMoviesUsecase.call(query);
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> clearMovies() async {
    movies = [];
  }

  @action
  Future<void> clearError() async {
    isError = false;
    errorMessage = '';
  }

  @computed
  bool get hasError => isError && errorMessage.isNotEmpty;

  @computed
  bool get hasMovies => movies.isNotEmpty;
}
