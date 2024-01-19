import 'package:gen_move/app/core/entities/usecase.dart';
import 'package:gen_move/app/modules/movie/domain/entities/movie.dart';
import 'package:gen_move/app/modules/movie/domain/repositories/movie_repository.dart';

class SearchMoviesUsecase implements IUsecase<List<Movie>, String> {
  final MovieRepository _movieRepository;

  SearchMoviesUsecase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  @override
  Future<List<Movie>> call(String query) async {
    try {
      final response = await _movieRepository.getMovies();
      final filtered = response
          .where(
            (element) => element.title.toLowerCase().contains(
                  query.toLowerCase(),
                ),
          )
          .toList();
      return filtered;
    } catch (e) {
      return [];
    }
  }
}
