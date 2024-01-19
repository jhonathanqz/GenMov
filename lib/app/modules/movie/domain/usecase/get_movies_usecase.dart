import 'package:gen_move/app/core/entities/usecase.dart';
import 'package:gen_move/app/modules/movie/domain/entities/movie.dart';
import 'package:gen_move/app/modules/movie/domain/repositories/movie_repository.dart';

class GetMoviesUsecase implements IUsecase<List<Movie>, NoParams> {
  final MovieRepository _movieRepository;

  GetMoviesUsecase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  @override
  Future<List<Movie>> call(NoParams params) async {
    try {
      return await _movieRepository.getMovies();
    } catch (e) {
      return [];
    }
  }
}
