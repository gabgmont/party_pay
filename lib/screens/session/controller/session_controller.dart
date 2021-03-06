import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/model/session/session_order_model.dart';
import 'package:partypay/model/session/session_resume_model.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/session/menu_model.dart';
import '../../../rest/client/menu_client.dart';
import '../../../rest/client/session_client.dart';

class SessionController {
  bool initialized = false;
  late SessionModel sessionModel;
  late UserModel loggedUser;
  late SessionResumeModel sessionResume;
  late MenuModel menu;

  var sessionClient = SessionClient();
  var menuClient = MenuClient();

  Future init(BuildContext context, SessionModel model) async {
    sessionModel = model;
    var prefs = await SharedPreferences.getInstance();
    var userJson = jsonDecode(prefs.getString('user')!);
    loggedUser = UserModel.fromJson(userJson);

    var futureMenu = await menuClient.getMenu(context, model.menuId);
    if(futureMenu == null) return;
    menu = futureMenu;
    initialized = true;
    return;
  }

  Future<bool> addUsers(BuildContext context, List<UserModel> users) async {
    var usernames = users.map((e) => e.username).toList();
    var sucess = await sessionClient.addUsers(context, sessionModel.id, usernames);

    if (sucess == null) return false;
    sessionModel.userList.addAll(users);
    return true;
  }

  Future<bool> addOrder(BuildContext context, int orderId,
      List<UserModel> users) async {
    var usernames = users.map((e) => e.username!).toList();
    var sessionOrder =
    await sessionClient.addOrder(context, sessionModel.id, orderId, usernames);

    if (sessionOrder == null) return false;
    sessionModel.sessionOrderList = sessionOrder;
    return true;
  }

  Future<bool> showSessionResume(BuildContext context) async {
    var resume =
    await sessionClient.getSessionResume(context, sessionModel.id);
    if (resume == null) return false;

    sessionResume = resume;
    return true;
  }

  Future<bool> closeSession(BuildContext context) async {
    var resume =
    await sessionClient.closeSession(context, sessionModel.id, true);
    if (resume == null) return false;

    sessionResume = resume;
    return true;
  }

  double getTotalValue() {
    double totalValue = 0.0;
    for (var element in sessionModel.sessionOrderList) {
      totalValue += element.order.value;
    }

    var value = totalValue.toStringAsFixed(2);
    return double.parse(value);
  }

  double getLoggedUserValue() {
    double userValue = 0.0;
    var loggedUserOrders = <SessionOrderModel>[];

    loggedUserOrders = sessionModel.sessionOrderList
        .where((element) => element.userList.contains(loggedUser))
        .toList();

    for (var element in loggedUserOrders) {
      double dividedValue = element.order.value / element.userList.length;
      userValue += dividedValue;
    }
    var value = userValue.toStringAsFixed(2);
    return double.parse(value);
  }
}
