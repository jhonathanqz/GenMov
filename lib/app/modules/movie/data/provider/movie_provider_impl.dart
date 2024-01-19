import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gen_move/app/modules/movie/infrastructure/contract/movie_provider.dart';

class MovieProviderImpl implements MovieProvider {
  final String _basePath;

  MovieProviderImpl({
    required String basePath,
  }) : _basePath = basePath;

  final String _fileName = 'movie.json';

  @override
  Future<dynamic> getMovies() async {
    try {
      final response = await rootBundle.loadString('$_basePath/$_fileName');
      final map = jsonDecode(response);
      return map;
    } catch (e) {
      rethrow;
    }
  }
}
