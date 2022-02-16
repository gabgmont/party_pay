import 'package:flutter/material.dart';
import 'package:partypay/screens/session/pages/session_body.dart';

import 'pages/session_menu_drawer.dart';
import 'pages/session_users_end_drawer.dart';
import 'widgets/session_bottom_navigation_bar.dart';
import 'widgets/session_page_appbar_widget.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({Key? key}) : super(key: key);

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .13),
        child: const SessionPageAppBar(),
      ),
      drawer: SessionMenuDrawer(),
      endDrawer: SessionUsersEndDrawer(),
      body: SessionBody(),
      bottomNavigationBar: SessionBottomNavigationBar(
        closeButtonTap: () {
          setState(() {});
        },
      ),
    );
  }
}
