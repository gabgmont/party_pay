import 'package:flutter/material.dart';
import 'package:partypay/model/restaurant/restaurant_model.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/rest/client/session_client.dart';
import 'package:partypay/screens/home/widgets/double_big_button_widget.dart';
import 'package:partypay/screens/home/widgets/hp_app_bar.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/double_big_button_wlist_widget.dart';
import 'widgets/round_restaurant_card_widget.dart';

const recentActivity = 'Atividade Recente';
const restaurants = 'Restaurantes';
const newSession = 'Iniciar Sessão';
const enterSession = 'Entrar na sessão';

class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SessionModel? _sessionModel;
  final _sessionClient = SessionClient();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.28),
        child: HomePageAppBar(
          user: widget.user,
          onTap: () async {
            Navigator.pushNamed(context, '/profile_page',
                    arguments: widget.user)
                .then((shouldLogout) {
              if (shouldLogout == null) return;
              if (shouldLogout as bool) {
                Navigator.pushReplacementNamed(context, '/login_page');
              }
            });
          },
        ),
      ),
      body: FutureBuilder(
        future: checkSession(),
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
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundRestaurantCardWidget(
                              restaurant: RestaurantModel.outback,
                              shape: Shape.ROUND,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DoubleBigButtonWListWidget(
                            label: recentActivity, onTap: () {}),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DoubleBigButtonWidget(
                            label: restaurants, onTap: () {}),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: _sessionModel == null
                              ? _createSession()
                              : _enterOpenSession()),
                    ],
                  ),
                ),
              );
          }
          return Container();
        },
      ),
    );
  }

  Future checkSession() async {
    var prefs = await SharedPreferences.getInstance();
    var sessionId = prefs.getInt('session_id');
    if (sessionId != null) {
      _sessionModel = await _sessionClient.getSession(context, sessionId);
    }

    return prefs;
  }

  DoubleBigButtonWidget _createSession() {
    return DoubleBigButtonWidget(
      label: newSession,
      onTap: () {
        Navigator.pushNamed(context, '/session_create_page',
                arguments: widget.user)
            .then((value) => setState(() {
                  print('CREATE SESSION PAGE');
                }));
      },
    );
  }

  DoubleBigButtonWidget _enterOpenSession() {
    return DoubleBigButtonWidget(
      label: enterSession,
      onTap: () {
        Navigator.pushNamed(context, '/session_page', arguments: _sessionModel)
            .then((value) => setState(() {
                  print('SESSION PAGE');
                }));
      },
    );
  }
}
