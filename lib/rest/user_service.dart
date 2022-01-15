import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'partypay_api_service.dart';

class UserService {

  Future<User?> getUser(BuildContext context, String cpf) async {
    var path = PartyPayService.getUser + '?cpf=$cpf';

    var response = await PartyPayService().get(path);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    print(json);
    if(response.statusCode == 200) {
      return User(
        name: json[0]['name'],
        cpf: json[0]['cpf'],
        email: json[0]['email'],
        phone: json[0]['phone'],
        photo: json[0]['photo'],
      );
    }
    SnackBar(
      backgroundColor: AppColors.secondary,
      content: Text(
        json['message'],
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}