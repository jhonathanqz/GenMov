import 'package:gen_move/app/modules/movie/data/dto/movie_dto.dart';

abstract class MovieProvider {
  Future<MovieDTO> getMovies();
}
