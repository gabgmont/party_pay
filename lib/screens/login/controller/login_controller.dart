import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:partypay/model/auth/auth_model.dart';
import 'package:partypay/rest/partypay_api_service.dart';
import 'package:partypay/rest/client/user_client.dart';
import 'package:partypay/screens/home/home_page.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

const fillAllFields = 'Preencha todos os campos.';

class LoginController {
  final PartyPayService _service = PartyPayService();
  final UserClient _userService = UserClient();

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
    var response = await _service.post(PartyPayService.auth, authJson);
    if (response == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text('Ocorreu um erro no servidor da aplicacao.'),
        ),
      );
      return false;
    }
    ;

    var json = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(json['message']),
        ),
      );
      return false;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', json['token']);

    var user = await _userService.getUser(context, cpf);
    prefs.setString('user', user!.toJson().toString());

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage(user: user)));
    return true;
  }
}
