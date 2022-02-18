import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/model/session/session_order_model.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/rest/partypay_api_service.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class SessionClient {
  final service = PartyPayService();

  Future<SessionModel?> getSession(BuildContext context, int sessionId) async {
    var path =
        PartyPayService.getSession.replaceAll('{sessionId}', '$sessionId');

    var response = await service.get(path);

    if (response == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text('Ocorreu um erro no servidor da aplicacao.'),
        ),
      );
      return null;
    }

    var body = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(body['message']),
        ),
      );
      return null;
    }

    return SessionModel.fromJson(body);
  }

  Future<SessionModel?> createSession(
      BuildContext context, String restaurant, int table) async {
    var json = {'"restaurant"': '"$restaurant"', '"table"': table};

    var response = await service.post(PartyPayService.createSession, json);

    var body = checkResponse(context, response);
    if (body == null) return null;
    return SessionModel.fromJson(body);
  }

  Future<List<UserModel>?> addUsers(
      BuildContext context, int sessionId, List<String?> cpfs) async {
    var path = PartyPayService.addUser.replaceAll('{sessionId}', '$sessionId');
    var json = {'"cpf_list"': jsonEncode(cpfs)};
    var response = await service.put(path, json);

    var body = checkResponse(context, response);

    if (body == null) return null;

    return (body['user_list'] as List)
        .map((json) => UserModel(name: json['name'], cpf: json['cpf']))
        .toList();
  }

  Future<List<SessionOrderModel>?> addOrder(BuildContext context, int sessionId,
      String orderName, List<String> cpfs) async {
    var path = PartyPayService.addOrder
        .replaceAll('{sessionId}', '$sessionId')
        .replaceAll('{orderName}', orderName);

    var json = {'"cpf_list"': jsonEncode(cpfs)};
    var response = await service.put(path, json);
    var body = checkResponse(context, response);
    if (body == null) return null;

    return (body['order_list'] as List).map((orderJson) => SessionOrderModel.fromJson(orderJson)).toList();
  }

  Future<bool> closeSession(
      BuildContext context, int sessionId, bool forceClose) async {
    var path =
        PartyPayService.closeSession.replaceAll('{sessionId}', '$sessionId');
    path = forceClose ? '$path?forceClose=$forceClose' : path;

    var response = await service.put(path, null);
    var body = checkResponse(context, response);
    if (body == null) return false;
    return true;
  }

  Map<String, dynamic>? checkResponse(
      BuildContext context, Response? response) {
    if (response == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text('Ocorreu um erro no servidor da aplicacao.'),
        ),
      );
      return null;
    }
    var body = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(body['message']),
        ),
      );
      return null;
    }
    return body;
  }
}
