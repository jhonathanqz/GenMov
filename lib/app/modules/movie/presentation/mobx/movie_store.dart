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
  bool _isLoading = false;

  @observable
  bool isError = false;

  @observable
  String errorMessage = '';

  @observable
  List<Movie> movies = [];

  @action
  Future<void> getMovies() async {
    _isLoading = true;
    isError = false;
    errorMessage = '';
    try {
      movies = await _getMoviesUsecase.call(NoParams());
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    }
    _isLoading = false;
  }

  @action
  Future<void> getTopRatedMovies() async {
    _isLoading = true;
    isError = false;
    errorMessage = '';
    try {
      movies = await _getTopRatedMoviesUsecase.call(NoParams());
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    }
    _isLoading = false;
  }

  @action
  Future<void> getPopularMovies() async {
    _isLoading = true;
    isError = false;
    errorMessage = '';
    try {
      movies = await _getPopularMoviesUsecase.call(NoParams());
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    }
    _isLoading = false;
  }

  @action
  Future<void> searchMovies(String query) async {
    _isLoading = true;
    isError = false;
    errorMessage = '';
    try {
      movies = await _searchMoviesUsecase.call(query);
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    }
    _isLoading = false;
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

  @computed
  bool get isLoading => _isLoading;
}
