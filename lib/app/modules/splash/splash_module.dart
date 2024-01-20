import 'package:flutter_modular/flutter_modular.dart';

import 'splash_page.dart';
import 'splash_store.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<SplashStore>(
      (i) => SplashStore(),
      //onDispose: (e) => e.dispose(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
