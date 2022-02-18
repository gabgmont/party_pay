import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/model/user/user_model.dart';

import '../../../model/session/menu_model.dart';
import '../../../rest/client/menu_client.dart';
import '../../../rest/client/session_client.dart';

class SessionController {
  late SessionModel sessionModel;
  MenuModel? menu;

  var sessionClient = SessionClient();
  var menuClient = MenuClient();

  Future<MenuModel?> init(BuildContext context, SessionModel model) async {
    sessionModel = model;
    if (menu != null) return null;

    var future = menuClient.getMenu(context, model.restaurant);
    future.then((futureMenu) => menu = futureMenu);
    return future;
  }

  Future<bool> addUsers(BuildContext context, List<UserModel> users) async {
    var cpfs = users.map((e) => e.cpf).toList();
    var sucess = await sessionClient.addUsers(context, sessionModel.id, cpfs);

    if (sucess == null) return false;
    sessionModel.userList.addAll(users);
    return true;
  }

  Future<bool> addOrder(
      BuildContext context, String orderName, List<UserModel> users) async {
    var cpfs = users.map((e) => e.cpf!).toList();
    var sessionOrder =
        await sessionClient.addOrder(context, sessionModel.id, orderName, cpfs);

    if (sessionOrder == null) return false;
    sessionModel.sessionOrderList = sessionOrder;
    return true;
  }

  double getTotalValue(){
    double totalValue = 0.0;
    for (var element in sessionModel.sessionOrderList) {
      totalValue += element.order.value;
    }

    return totalValue;
  }

  double getUserValue(){
    double userValue = 0.0;

    return userValue;
  }
}
