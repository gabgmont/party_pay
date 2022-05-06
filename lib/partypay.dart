import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:partypay/navigation_service.dart';

class PartyPayApp extends StatelessWidget {
  const PartyPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(NavigationService.navigationKey);
    Modular.setInitialRoute('/splash_page');

    return MaterialApp.router(
      title: 'Partypay',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
