import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:partypay/model/restaurant/restaurant_model.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/rest/client/session_client.dart';
import 'package:partypay/rest/client/user_client.dart';
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
  var usersList = <UserModel>[];

  var userCardList = <Widget>[];
  var restaurantList = <Map>[];

  final _sessionService = SessionClient();
  final _userService = UserClient();

  var prefs = SharedPreferences.getInstance();

  void init(UserModel user) {
    if (usersList.isNotEmpty) return;

    usersList.add(user);
    userCardList.add(
        UserRoundCardWidget(initials: user.getInitials(), photo: user.photo));

    restaurantList.add(RestaurantModel.outback);
    restaurantList.add(RestaurantModel.cocoBambu);
  }

  Future<SessionModel?> startSession(BuildContext context) async {
    if (restaurant == null || table == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(selectTableAndRestaurant),
        ),
      );
      return null;
    }

    var sessionModel =
        await _sessionService.createSession(context, restaurant!, table!);
    if (sessionModel == null) return null;

    var cpfs = usersList.map((e) => e.cpf).toList();
    var sucess = await _sessionService.addUsers(context, sessionModel.id, cpfs);
    if (sucess != null) {
      var prefs = await SharedPreferences.getInstance();
      prefs.setInt('session_id', sessionModel.id);

      sessionModel.userList.addAll(usersList);
      return sessionModel;
    }

    _sessionService.closeSession(context, sessionModel.id, true);
    return null;
  }

  Future<UserModel?> getUser(BuildContext context, String cpf) async {
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

    var user = await _userService.getUser(context, cpf);
    if (user == null) return null;
    usersList.add(user);
    return user;
  }

  Future<UserModel> getPrefUser() async {
    var prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('user');

    var userMap = jsonDecode(user!);
    return UserModel.fromJson(userMap);
  }
}
