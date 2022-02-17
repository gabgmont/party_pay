import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:partypay/model/session/session_model.dart';
import 'package:partypay/rest/partypay_api_service.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class SessionClient {
  final service = PartyPayService();

  Future<SessionModel?> createSession(
      BuildContext context, String restaurant, int table) async {
    var json = {'"restaurant"': '"$restaurant"', '"table"': table};

    var response = await service.post(PartyPayService.createSession, json);

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

  Future<bool> addUsers(
      BuildContext context, int sessionId, List<String?> cpfs) async {
    var path = PartyPayService.addUser.replaceAll('{sessionId}', '$sessionId');
    var json = {'"cpf_list"': jsonEncode(cpfs)};
    var response = await service.put(path, json);
    if (response == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text('Ocorreu um erro no servidor da aplicacao.'),
        ),
      );
      return false;
    }
    var body = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(body['message']),
        ),
      );
      return false;
    }

    return true;
  }

  Future<bool> closeSession(BuildContext context, int sessionId, bool forceClose) async {
    var path = PartyPayService.closeSession.replaceAll('{sessionId}', '$sessionId');
    path = forceClose ? '$path?forceClose=$forceClose' : path;

    var response = await service.put(path, null);
    if (response == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text('Ocorreu um erro no servidor da aplicacao.'),
        ),
      );
      return false;
    }
    var body = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(body['message']),
        ),
      );
      return false;
    }

    return true;
  }
}
