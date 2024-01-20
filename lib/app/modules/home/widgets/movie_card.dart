import 'package:flutter/material.dart';
import 'package:gen_move/app/modules/movie/domain/entities/movie.dart';
import 'package:gen_move/app/shared/styles/app_text_styles.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.size,
  });
  final Movie movie;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final posterPath = 'assets/images${movie.posterPath}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: size.width * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                child: Image.asset(
                  posterPath,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Text(movie.originalTitle, style: AppTextStyles.simpleWhiteBold),
            Text(
              movie.dateView,
              style: TextStyle(
                color: Colors.grey.shade400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
