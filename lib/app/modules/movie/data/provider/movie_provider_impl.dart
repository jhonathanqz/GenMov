import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gen_move/app/modules/movie/infrastructure/contract/movie_provider.dart';

import '../dto/movie_dto.dart';

class MovieProviderImpl implements MovieProvider {
  final String _basePath;

  MovieProviderImpl({
    required String basePath,
  }) : _basePath = basePath;

  final String _fileName = 'movies_mock.json';

  @override
  Future<MovieDTO> getMovies() async {
    try {
      final response = await rootBundle.loadString('$_basePath/$_fileName');
      final dto = MovieDTO.fromJson(response);
      return dto;
    } catch (e) {
      debugPrint('***erro_provider: $e');
      rethrow;
    }
  }
}
