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
const fillInUsername = 'Preencha o usuario antes de adicionar.';
const userAlreadyAdded = 'Usuário já adicionado.';

class CreateSessionController {
  int sessionId = -1;
  RestaurantModel? restaurant;
  int? table;
  bool initialized = false;
  var usersList = <UserModel>[];

  var userCardList = <Widget>[];
  var restaurantList = <RestaurantModel>[];

  final _sessionService = SessionClient();
  final _userService = UserClient();

  var prefs = SharedPreferences.getInstance();

  Future init(BuildContext context, UserModel user) async {
    if (usersList.isNotEmpty) return;

    usersList.add(user);
    userCardList.add(
        UserRoundCardWidget(initials: user.getInitials(), photo: user.photo));
    await getRestaurants(context);
    initialized = true;
    return;
  }

  getRestaurants(BuildContext context) async {
    var list = await _sessionService.getRestaurants(context);

    if (list == null) return;
    restaurantList = list;
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
    var usernames = usersList.map((e) => e.username).toList();
    var sessionModel = await _sessionService.createSession(
        context, restaurant!.id, table!, usernames);

    if (sessionModel == null) return null;

    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('session_id', sessionModel.id);
    return sessionModel;
  }

  Future<UserModel?> getUser(BuildContext context, String username) async {
    if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(fillInUsername),
        ),
      );
      return null;
    }

    for (var user in usersList) {
      if (user.usernameValue() == username) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.secondary,
            content: Text(userAlreadyAdded),
          ),
        );
        return null;
      }
    }

    var user = await _userService.getUser(context, username);
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
