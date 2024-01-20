import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/splash/');
    return MaterialApp.router(
      title: 'GenMov',
      theme: materialThemeData,
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }

  static ThemeData get materialThemeData => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
