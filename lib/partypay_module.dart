import 'package:flutter_modular/flutter_modular.dart';

import 'model/session/session_model.dart';
import 'model/user/user_model.dart';
import 'screens/create_session/session_create_page.dart';
import 'screens/home/home_page.dart';
import 'screens/login/login_page.dart';
import 'screens/profile/profile_page.dart';
import 'screens/resume/resume_page.dart';
import 'screens/session/controller/session_controller.dart';
import 'screens/session/session_page.dart';
import 'screens/signup/signup_page.dart';
import 'screens/splash/splash_page.dart';

const routeToSplashPage = '/splash_page';
const routeToLoginPage = '/login_page';
const routeToHomePage = '/home_page';
const routeToProfilePage = '/profile_page';
const routeToSessionCreatePage = '/session_create_page';
const routeToSessionPage = '/session_page';
const routeToResumePage = '/resume_page';
const routeToSignupPage = '/signup_page';

class PartyPayModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(routeToSplashPage, child: (context, args) => const SplashPage()),
        ChildRoute(routeToLoginPage, child: (context, args) => LoginPage()),
        ChildRoute(routeToHomePage,
            child: (context, args) => HomePage(
                  user: args.data == null
                      ? UserModel(name: 'Guest')
                      : args.data as UserModel,
                )),
        ChildRoute(routeToProfilePage,
            child: (context, args) => ProfilePage(
                  user: args.data == null
                      ? UserModel(name: 'Guest')
                      : args.data as UserModel,
                )),
        ChildRoute(routeToSessionCreatePage,
            child: (context, args) => SessionCreatePage(
                  user: args.data == null
                      ? UserModel(name: 'Guest')
                      : args.data as UserModel,
                )),
        ChildRoute(routeToSessionPage,
            child: (context, args) =>
                SessionPage(sessionModel: args.data as SessionModel)),
        ChildRoute(routeToResumePage,
            child: (context, args) =>
                ResumePage(sessionController: args.data as SessionController)),
        ChildRoute(routeToSignupPage,
            child: (context, args) => const SignUpPage()),
      ];
}
