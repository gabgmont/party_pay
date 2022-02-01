import 'package:flutter/material.dart';

import 'model/user/user_model.dart';
import 'screens/create_session/session_create_page.dart';
import 'screens/home/home_page.dart';
import 'screens/login/login_page.dart';
import 'screens/profile/profile_page.dart';
import 'screens/session/session_page.dart';
import 'screens/splash/splash_page.dart';

class PartyPayApp extends StatelessWidget {
  const PartyPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partypay',
      initialRoute: '/session_page',
      routes: {
        '/splash_page': (context) => const SplashPage(),
        '/login_page': (context) => LoginPage(),
        '/home_page': (context) => HomePage(
            user: ModalRoute.of(context)!.settings.arguments == null
                ? User(name: 'Guest')
                : ModalRoute.of(context)!.settings.arguments as User),

        '/profile_page': (context) => ProfilePage(
            user: ModalRoute.of(context)!.settings.arguments == null
                ? User(name: 'Guest')
                : ModalRoute.of(context)!.settings.arguments as User),

        '/session_create_page': (context) => SessionCreatePage(
            user: ModalRoute.of(context)!.settings.arguments == null
                ? User(name: 'Guest')
                : ModalRoute.of(context)!.settings.arguments as User
        ),

        '/session_page' : (context) => SessionPage()
      },
    );
  }
}
