import 'package:flutter/material.dart';

import 'close_session_button.dart';
import 'session_navigation_button.dart';

class SessionBottomNavigationBar extends StatelessWidget {
  final VoidCallback closeButtonTap;

  const SessionBottomNavigationBar(
      {Key? key,
      required this.closeButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .1486,
      width: size.width,
      child: Column(
        children: [
          Divider(
            indent: size.width * .08,
            endIndent: size.width * .08,
            thickness: 1,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SessionNavigationButton(
                  label: 'Menu',
                  icon: Icons.restaurant_menu,
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  }),
              CloseSessionButton(
                onTap: closeButtonTap,
              ),
              SessionNavigationButton(
                  label: 'Users',
                  icon: Icons.groups,
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  })
            ],
          ),
        ],
      ),
    );
  }
}
