import 'package:flutter/material.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/screens/session/controller/session_controller.dart';
import 'package:partypay/screens/session/pages/session_body.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'pages/session_menu_drawer.dart';
import 'pages/session_users_end_drawer.dart';
import 'pages/add_user_bottom_sheet.dart';
import 'widgets/alert_widget.dart';
import 'widgets/session_page_appbar_widget.dart';

const errorLoadingSession = 'Erro ao carregar sessão';

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
        child: FutureBuilder(
          future: _futureMenu,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                return SessionPageAppBar(
                  sessionController: sessionController,
                );
            }
            return Container();
          },
        )
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
                sessionController: sessionController,
                onConfirmOrder: () {
                  setState(() {});
                },
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
                  Scaffold.of(context)
                      .showBottomSheet((context) => AddUserBottomSheet(
                            sessionController: sessionController,
                          ));
                },
              );
          }
          return Container();
        },
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _futureMenu,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return SizedBox(
                  height: size.height * .61,
                  child: const Center(
                    child:
                        CircularProgressIndicator(color: AppColors.secondary),
                  ),
                );

              case ConnectionState.active:
                break;
              case ConnectionState.done:
                return SessionBody(
                  sessionController: sessionController,
                );
            }
            return SizedBox(
              height: size.height * .61,
              child: const AlertWidget(
                message: errorLoadingSession,
                icon: Icons.warning,
              ),
            );
          },
        ),
      ),
    );
  }
}
