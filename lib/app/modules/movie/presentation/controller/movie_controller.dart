import 'package:gen_move/app/modules/movie/presentation/mobx/movie_store.dart';

class MovieController {
  final MovieStore _movieStore;

  MovieController({
    required MovieStore movieStore,
  }) : _movieStore = movieStore;

  MovieStore get movieStore => _movieStore;

  bool get hasError => _movieStore.hasError;
  bool get hasMovies => _movieStore.hasMovies;
  bool get isLoading => _movieStore.isLoading;

  void stError(bool value) => _movieStore.stError(value);

  String filter = '';

  void stFilter(String value) {
    filter = value;
  }

  Future<void> getMovies() async {
    await _movieStore.getMovies();
  }

  Future<void> getTopRatedMovies() async {
    await _movieStore.getTopRatedMovies();
  }

  Future<void> getPopularMovies() async {
    await _movieStore.getPopularMovies();
  }

  Future<void> searchMovies() async {
    if (filter.isEmpty) {
      await _movieStore.getMovies();
      return;
    }
    await _movieStore.searchMovies(filter);
  }

  Future<void> clearMovies() async {
    await _movieStore.clearMovies();
  }

  Future<void> clearError() async {
    await _movieStore.clearError();
  }
}
