import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(10),
      color: Colors.blue,
      child: const Center(
        child: Icon(Icons.home),
      ),
    );
  }
}
