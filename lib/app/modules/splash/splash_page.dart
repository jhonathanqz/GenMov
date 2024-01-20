import 'package:flutter/material.dart';
import 'package:gen_move/app/shared/styles/app_images.dart';

import 'splash_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashStore store = SplashStore();

  @override
  void initState() {
    store.dismiss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Image.asset(AppImages.marvelStudios),
        ),
      ),
    );
  }
}
