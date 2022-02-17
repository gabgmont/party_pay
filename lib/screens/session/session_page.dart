import 'package:flutter/material.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/screens/session/controller/session_controller.dart';
import 'package:partypay/screens/session/pages/session_body.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'pages/session_menu_drawer.dart';
import 'pages/session_users_end_drawer.dart';
import 'widgets/session_bottom_navigation_bar.dart';
import 'widgets/session_page_appbar_widget.dart';

class SessionPage extends StatefulWidget {
  final SessionModel sessionModel;

  const SessionPage({Key? key, required this.sessionModel}) : super(key: key);

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  final SessionController sessionController = SessionController();

  @override
  Widget build(BuildContext context) {
    var _futureMenu = sessionController.init(context, widget.sessionModel);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .13),
        child: SessionPageAppBar(
          restaurant: sessionController.sessionModel.restaurant,
          table: sessionController.sessionModel.table,
          individualValue: 0.0,
          totalValue: 0.0,
        ),
      ),
      drawer: FutureBuilder(
        future: _futureMenu,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondary,
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return SessionMenuDrawer(
                menu: sessionController.menu!,
              );
          }
          return Container();
        },
      ),
      endDrawer: FutureBuilder(
        future: _futureMenu,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(color: AppColors.secondary),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return SessionUsersEndDrawer(
                users: sessionController.sessionModel.userList,
                trailingTap: () {
                  Scaffold.of(context).showBottomSheet((context) => _showBottomSheet(context, size));

                  // sessionController.addUsers(context, );
                },
              );
          }
          return Container();
        },
      ),
      body: SessionBody(),
      // bottomNavigationBar: SessionBottomNavigationBar(
      //   closeButtonTap: () {
      //     setState(() {});
      //   },
      // ),
    );
  }
}

BottomSheet _showBottomSheet(BuildContext context, Size size){
  return BottomSheet(
      onDragStart: (_) {
        Navigator.pop(context);
      },
      constraints:
      BoxConstraints.expand(height: size.height * .6),
      onClosing: () {},
      builder: (context) {
        return Container();
      });
}
