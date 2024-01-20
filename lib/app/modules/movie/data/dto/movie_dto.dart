import 'dart:convert';

import 'package:gen_move/app/modules/movie/domain/entities/movie.dart';

class MovieDTO extends Movie {
  final List<Movie> mcu;
  MovieDTO({
    required this.mcu,
  }) : super(
          adult: false,
          backdropPath: '',
          genreIds: [],
          id: 0,
          originalLanguage: '',
          originalTitle: '',
          overview: '',
          popularity: 0.0,
          posterPath: '',
          releaseDate: '',
          title: '',
          video: false,
          voteAverage: 0,
          voteCount: 0,
        );

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mcu': mcu.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDTO.fromMap(Map<String, dynamic> map) {
    return MovieDTO(
      mcu: List<Movie>.from(
        (map['mcu'] as List<dynamic>).map<Movie>(
          (x) => Movie.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory MovieDTO.fromJson(String source) =>
      MovieDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
