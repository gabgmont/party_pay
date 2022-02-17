import 'package:flutter/cupertino.dart';
import 'package:partypay/model/session/session_model.dart';

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
    var future = menuClient.getMenu(context, model.restaurant);
    future.then((futureMenu) => menu = futureMenu);

    return future;
  }

  Future<bool> addUsers(BuildContext context, List<String> cpfs) async {
    var users = await sessionClient.addUsers(context, sessionModel.id, cpfs);

    if (users != null) {
      sessionModel.userList.addAll(users);
      return true;
    }
     return false;
  }
}
