import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';
import 'modules/localstorage/localstorage_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        LocalstorageModule(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/splash', module: SplashModule()),
//        ModuleRoute('/home', module: HomeModule()),
      ];

  @override
  // ignore: override_on_non_overriding_member
  Widget get bootstrap => const App();
}
