import 'package:flutter/material.dart';

import 'screens/home/home_page.dart';
import 'screens/login/login_page.dart';
import 'screens/splash/splash_page.dart';

class PartyPayApp extends StatelessWidget {
  const PartyPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partypay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/splash_page' : (context) => const SplashPage(),
        '/login_page' : (context) => LoginPage(),
        '/home_page': (context) => HomePage()
      },
    );
  }
}
