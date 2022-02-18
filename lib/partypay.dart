import 'package:flutter/material.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/screens/create_session/session_create_page.dart';
import 'package:partypay/screens/home/home_page.dart';
import 'package:partypay/screens/login/login_page.dart';
import 'package:partypay/screens/profile/profile_page.dart';
import 'package:partypay/screens/session/session_page.dart';

import 'screens/splash/splash_page.dart';

class PartyPayApp extends StatelessWidget {
  const PartyPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partypay',
      initialRoute: '/splash_page',
      // home: SplashPage(),
      routes: {
        '/splash_page': (context) => const SplashPage(),
        '/login_page': (context) => LoginPage(),
        '/home_page': (context) => HomePage(
              user: ModalRoute.of(context)?.settings.arguments == null
                  ? UserModel(name: 'Guest')
                  : ModalRoute.of(context)?.settings.arguments as UserModel,
            ),
        '/profile_page': (context) => ProfilePage(
              user: ModalRoute.of(context)?.settings.arguments == null
                  ? UserModel(name: 'Guest')
                  : ModalRoute.of(context)?.settings.arguments as UserModel,
            ),
        '/session_create_page': (context) => SessionCreatePage(
              user: ModalRoute.of(context)?.settings.arguments == null
                  ? UserModel(name: 'Guest')
                  : ModalRoute.of(context)?.settings.arguments as UserModel,
            ),
        '/session_page': (context) => SessionPage(
              sessionModel: ModalRoute.of(context)?.settings.arguments as SessionModel
            )
      },
    );
  }
}
