import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:partypay/model/restaurant/restaurant_model.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/model/session/session_order_model.dart';
import 'package:partypay/model/session/session_resume_model.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/rest/partypay_api_service.dart';

class SessionClient {
  final _service = PartyPayService();

  Future<List<RestaurantModel>?> getRestaurants(BuildContext context) async {
    var response = await _service.get(PartyPayService.getRestaurants);

    var body = _service.checkResponse(context, response, true);

    if(body== null) return null;
    return (body as List).map((json) => RestaurantModel.fromJson(json)).toList();
  }

  Future<SessionModel?> getSession(BuildContext context, int sessionId) async {
    String path =
        PartyPayService.getSession.replaceAll('{sessionId}', '$sessionId');

    var response = await _service.get(path);

    var body = _service.checkResponse(context, response, true);

    if(body == null) return null;
    return SessionModel.fromJson(body);
  }

  Future<SessionModel?> getUserSession(BuildContext context, String username) async {
    String path = PartyPayService.getUserSession.replaceAll("{username}", username);

    var response = await _service.get(path);
    var body = _service.checkResponse(context, response, false);

    if (body == null) return null;
    return SessionModel.fromJson(body);
  }

  Future<SessionModel?> createSession(
      BuildContext context, int restaurantId, int table, List<String?> usernames) async {
    var json = {'"menu_id"': restaurantId, '"table"': table, '"users"' : {'"username_list"': jsonEncode(usernames)}};

    var response = await _service.post(PartyPayService.createSession, json);

    var body = _service.checkResponse(context, response, true);
    if (body == null) return null;
    return SessionModel.fromJson(body);
  }

  Future<List<UserModel>?> addUsers(
      BuildContext context, int sessionId, List<String?> usernames) async {
    var path = PartyPayService.addUser.replaceAll('{sessionId}', '$sessionId');
    var json = {'"username_list"': jsonEncode(usernames)};
    var response = await _service.put(path, json);

    var body = _service.checkResponse(context, response, true);

    if (body == null) return null;

    return (body['user_list'] as List)
        .map((json) => UserModel(name: json['name'], username: json['username']))
        .toList();
  }

  Future<List<SessionOrderModel>?> addOrder(BuildContext context, int sessionId,
      int orderId, List<String> usernames) async {
    var path = PartyPayService.addOrder
        .replaceAll('{sessionId}', '$sessionId')
        .replaceAll('{orderId}', '$orderId');

    var json = {'"username_list"': jsonEncode(usernames)};
    var response = await _service.put(path, json);
    var body = _service.checkResponse(context, response, true);
    if (body == null) return null;

    return (body['order_list'] as List)
        .map((orderJson) => SessionOrderModel.fromJson(orderJson))
        .toList();
  }

  Future<SessionResumeModel?> getSessionResume(
      BuildContext context, int sessionId) async {
    var path =
        PartyPayService.sessionResume.replaceAll('{sessionId}', '$sessionId');

    var response = await _service.get(path);
    var body = _service.checkResponse(context, response, true);
    if (body == null) return null;

    return SessionResumeModel.fromJson(body);
  }

  Future<SessionResumeModel?> closeSession(
      BuildContext context, int sessionId, bool forceClose) async {
    var path =
        PartyPayService.closeSession.replaceAll('{sessionId}', '$sessionId');
    path = forceClose ? '$path?forceClose=$forceClose' : path;

    var response = await _service.put(path, null);
    var body = _service.checkResponse(context, response, true);
    if (body == null) return null;

    return SessionResumeModel.fromJson(body);
  }

}
