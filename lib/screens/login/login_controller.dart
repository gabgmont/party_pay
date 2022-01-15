import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:partypay/model/auth/auth_model.dart';
import 'package:partypay/rest/partypay_api_service.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

const fillAllFields = 'Preencha todos os campos.';

class LoginController {
  final PartyPayService service = PartyPayService();

  Future<bool> login(BuildContext context, String cpf, String secret) async {
    if (cpf == '' || secret == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(
            fillAllFields,
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
      return false;
    }

    var authJson = AuthenticationModel(cpf, secret).toJson();
    var response = await service.post(PartyPayService.auth, authJson);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    print(json);

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(json['message']),
        ),
      );
      return false;
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', json['token']);
    return true;
  }
}
