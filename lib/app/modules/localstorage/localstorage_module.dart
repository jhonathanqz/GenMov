import 'package:flutter_modular/flutter_modular.dart';

import 'localstorage_binds.dart';

class LocalstorageModule extends Module {
  @override
  final List<Bind> binds = [
    ...LocalStorageBinds.getBinds(),
  ];

  @override
  final List<ModularRoute> routes = [];
}
