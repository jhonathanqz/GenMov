import 'package:gen_move/app/core/entities/usecase.dart';
import 'package:gen_move/app/modules/movie/domain/entities/movie.dart';
import 'package:gen_move/app/modules/movie/domain/repositories/movie_repository.dart';

class GetPopularMoviesUsecase implements IUsecase<List<Movie>, NoParams> {
  final MovieRepository _movieRepository;

  GetPopularMoviesUsecase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  @override
  Future<List<Movie>> call(NoParams params) async {
    try {
      final response = await _movieRepository.getMovies();
      response.sort((a, b) => b.popularity.compareTo(a.popularity));
      return response;
    } catch (e) {
      return [];
    }
  }
}
