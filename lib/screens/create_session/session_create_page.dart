import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/screens/home/widgets/round_restaurant_card_widget.dart';
import 'package:partypay/screens/session/widgets/enter_button_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppStyles.dart';

import 'controller/create_session_controller.dart';
import 'widget/username_add_form_field_widget.dart';
import 'widget/user_round_card_widget.dart';

const addUser = 'Adicionar usuário na mesa';
const createSession = 'Criar Sessão';
const selectRestaurant = 'Selecione o restaurante';
const table = 'Mesa';
const error = 'Erro ao carregar restaurantes';

class SessionCreatePage extends StatefulWidget {
  final UserModel user;

  const SessionCreatePage({Key? key, required this.user}) : super(key: key);

  @override
  State<SessionCreatePage> createState() => _SessionCreatePageState();
}

class _SessionCreatePageState extends State<SessionCreatePage> {
  final _textController = TextEditingController();
  final _sessionController = CreateSessionController();
  late Future _future;
  var tables = [10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30];
  int dropdownValue = 10;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    if (!_sessionController.initialized) {
      _future = _sessionController.init(context, widget.user);
    }
    _sessionController.table = dropdownValue;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(createSession),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  selectRestaurant,
                  style: AppStyles.mainLabel(color: AppColors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 160,
                  width: size.width,
                  child: FutureBuilder(
                    future: _future,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
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
                          return GridView.count(
                            crossAxisSpacing: 4,
                            crossAxisCount: 4,
                            children: <Widget>[
                              for (var i = 0;
                                  i < _sessionController.restaurantList.length;
                                  i++)
                                RoundRestaurantCardWidget(
                                  restaurant:
                                      _sessionController.restaurantList[i],
                                  shape: Shape.SQUARE,
                                  onTap: () => checkOption(i + 1),
                                  selected: i + 1 == selected,
                                ),
                            ],
                          );
                      }
                      return const Center(child: Text(error));
                    },
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(addUser,
                        style: AppStyles.mainLabel(color: AppColors.black))),
              ),
              UsernameAddFormFieldWidget(
                textController: _textController,
                onTap: () async {
                  var user = await _sessionController.getUser(
                      context, _textController.text);
                  if (user != null) {
                    setState(() {
                      _sessionController.userCardList.add(
                        UserRoundCardWidget(
                          initials: user.getInitials(),
                          photo: user.photo,
                        ),
                      );
                    });
                  }
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                height: size.height * 0.09,
                width: size.width * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _sessionController.userCardList,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.restaurant,
                    color: AppColors.primary,
                    size: 36,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      table,
                      style: AppStyles.mainLabel(color: AppColors.black),
                    ),
                  ),
                  DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.secondary,
                    ),
                    underline: Container(
                      height: 2,
                      color: AppColors.primary,
                    ),
                    items: tables
                        .map<DropdownMenuItem<int>>((table) => DropdownMenuItem(
                              value: table,
                              child: Text(
                                '$table',
                                style: AppStyles.orderName(),
                              ),
                            ))
                        .toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              EnterButtonWidget(
                onTap: () async {
                  var sessionModel =
                      await _sessionController.startSession(context);
                  if (sessionModel != null) {
                    Navigator.pushReplacementNamed(context, '/session_page',
                        arguments: sessionModel);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkOption(int index) {
    setState(() {
      selected = index;
      _sessionController.restaurant =
          _sessionController.restaurantList[selected - 1];
    });
  }
}
