import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:partypay/model/restaurant/restaurant_model.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/rest/session_service.dart';
import 'package:partypay/rest/user_service.dart';
import 'package:partypay/screens/create_session/widget/user_round_card_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

const selectTableAndRestaurant = 'Selecione o restaurante e uma mesa.';
const fillInCPF = 'Preencha o CPF antes de adicionar.';
const userAlreadyAdded = 'Usuário já adicionado.';

class CreateSessionController {
  int sessionId = -1;
  String? restaurant;
  int? table;
  var usersList = <User>[];

  var userCardList = <Widget>[];
  var restaurantList = <Map>[];

  var sessionService = SessionService();
  var userService = UserService();

  void init(User user) {
    if(usersList.isNotEmpty) return;

    usersList.add(user);
    userCardList.add(
        UserRoundCardWidget(initials: user.getInitials(), photo: user.photo));

    restaurantList.add(RestaurantModel.outback);
    restaurantList.add(RestaurantModel.cocoBambu);
  }

  Future<bool> startSession(BuildContext context) async {
    if (restaurant == null || table == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(selectTableAndRestaurant),
        ),
      );
      return false;
    }

    var sessionId =
        await sessionService.createSession(context, restaurant!, table!);
    if (sessionId < 0) return false;

    var cpfs = usersList.map((e) => e.cpf).toList();
    var sucess = await sessionService.addUsers(context, sessionId, cpfs);
    if (sucess) return true;

    sessionService.closeSession(context, sessionId, true);
    return false;
  }

  Future<User?> getUser(BuildContext context, String cpf) async {
    if (cpf.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(fillInCPF),
        ),
      );
      return null;
    }

    for (var user in usersList) {
      if (user.cpfValue() == cpf) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.secondary,
            content: Text(userAlreadyAdded),
          ),
        );
        return null;
      }
    }

    var user = await userService.getUser(context, cpf);
    if (user == null) return null;
    usersList.add(user);
    return user;
  }

  Future<User> getPrefUser() async {
    var prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('user');

    var userMap = jsonDecode(user!);
    return User(
        name: userMap['name'],
        cpf: userMap['cpf'],
        email: userMap['email'],
        phone: userMap['phone'],
        photo: userMap['photo']);
  }
}
