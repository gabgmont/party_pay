import 'package:flutter/material.dart';

import 'screens/splash/splash_page.dart';

class PartyPayApp extends StatelessWidget {
  const PartyPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Partypay',
      home: SplashPage(),
    );
  }
}
