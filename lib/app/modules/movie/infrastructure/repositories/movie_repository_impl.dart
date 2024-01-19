import 'package:gen_move/app/modules/movie/domain/entities/movie.dart';
import 'package:gen_move/app/modules/movie/domain/repositories/movie_repository.dart';
import 'package:gen_move/app/modules/movie/infrastructure/contract/movie_provider.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieProvider _movieProvider;

  MovieRepositoryImpl({required MovieProvider movieProvider}) : _movieProvider = movieProvider;

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await _movieProvider.getMovies();
      final modelList = (response as List<Map<String, dynamic>>).map((e) => Movie.fromMap(e)).toList();
      return modelList;
    } catch (e) {
      rethrow;
    }
  }
}
