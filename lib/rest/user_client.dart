import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'partypay_api_service.dart';

class UserClient {
  final service = PartyPayService();

  Future<User?> getUser(BuildContext context, String cpf) async {
    var path = PartyPayService.getUser + '?cpf=$cpf';

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

    var json = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(
            json['message'],
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
      return null;
    }

    return User(
      name: json[0]['name'],
      cpf: json[0]['cpf'],
      email: json[0]['email'],
      phone: json[0]['phone'],
      // photo: json[0]['photo'],
    );
  }
}
