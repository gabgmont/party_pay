import 'package:flutter/material.dart';

import 'model/user/user_model.dart';
import 'screens/home/home_page.dart';
import 'screens/login/login_page.dart';
import 'screens/profile/profile_page.dart';
import 'screens/splash/splash_page.dart';

class PartyPayApp extends StatelessWidget {
  const PartyPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partypay',
      initialRoute: '/splash_page',
      routes: {
        '/splash_page': (context) => SplashPage(),
        '/login_page': (context) => LoginPage(),
        '/home_page': (context) => HomePage(
            user: ModalRoute.of(context)!.settings.arguments == null
                ? User(name: 'Guest')
                : ModalRoute.of(context)!.settings.arguments as User),

        '/profile_page': (context) => ProfilePage(
            user: ModalRoute.of(context)!.settings.arguments == null
                ? User(name: 'Guest')
                : ModalRoute.of(context)!.settings.arguments as User)
      },
    );
  }
}
