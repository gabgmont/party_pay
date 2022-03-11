import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/session/session_model.dart';
import '../../../rest/client/session_client.dart';

class HomePageController {

  SessionModel? sessionModel;
  final _sessionClient = SessionClient();

  Future checkSession(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();

    var sessionId = prefs.getInt('session_id');
    if (sessionId != null) {
      var session = await _sessionClient.getSession(context, sessionId);
      if (session == null) return prefs;

      sessionModel = session;
      return sessionModel;
    }

    var user = prefs.getString('user');
    if (user != null) {
      var session =
      await _sessionClient.getUserSession(context, jsonDecode(user)['username']);
      if (session == null) return prefs;

      sessionModel = session;
      prefs.setInt('session_id', sessionModel!.id);
      return sessionModel;
    }

    return prefs;
  }
}
