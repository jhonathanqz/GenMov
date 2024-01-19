import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_move/app/modules/movie/movie_binds.dart';

class MovieModule extends Module {
  @override
  List<Bind> get binds => [
        ...MovieBinds.all,
      ];

  @override
  List<ModularRoute> get routes => [];
}
