import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app.dart';
import 'app/app_module.dart';
import 'app/core/config/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  setupEnv();
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
