import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/screens/create_session/controller/create_session_controller.dart';

import '../../../model/session/menu_model.dart';
import '../../../rest/menu_client.dart';
import '../../../rest/session_client.dart';

class SessionController {
  late SessionModel sessionModel;
  MenuModel? menu;

  var sessionClient = SessionClient();
  var menuClient = MenuClient();

  Future<MenuModel?> init(BuildContext context, SessionModel model) async {
    sessionModel = model;
    if(menu == null) {
      var future = menuClient.getMenu(context, model.restaurant);
      future.then((futureMenu) => menu = futureMenu);

      return future;
    }
  }

  Future<bool> addUsers(BuildContext context, List<UserModel> users) async {
    var cpfs = users.map((e) => e.cpf).toList();
    var sucess = await sessionClient.addUsers(context, sessionModel.id, cpfs);

    if (sucess != null) {
      sessionModel.userList.addAll(users);
      return true;
    }
     return false;
  }
}
