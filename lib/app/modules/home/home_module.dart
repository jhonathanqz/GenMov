import 'package:flutter_modular/flutter_modular.dart';

import '../movie/movie_module.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        MovieModule(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/movie', module: MovieModule()),
      ];
}
