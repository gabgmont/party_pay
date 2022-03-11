import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:partypay/model/auth/auth_model.dart';
import 'package:partypay/rest/client/user_client.dart';
import 'package:partypay/rest/partypay_api_service.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/user/user_model.dart';

const fillAllFields = 'Preencha todos os campos.';

class LoginController {
  final PartyPayService _service = PartyPayService();
  final UserClient _userService = UserClient();

  Future<bool> login(BuildContext context, String username, String secret) async {
    if (username == '' || secret == '') {
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

    var authJson = AuthenticationModel(username, secret).toJson();
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

    var user = await _userService.getUser(context, username);
    prefs.setString('user', user!.toJson().toString());

    Navigator.pushReplacementNamed(context, '/home_page', arguments: user);

    return true;
  }

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(name: response!.displayName!, email: response.email, photo: response.photoUrl);
      // await _userService.getUser(context, user.email!);
      Navigator.pushReplacementNamed(context, '/home_page', arguments: user);

    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text("Erro ao realizar login."),
        ),
      );
    }
  }
}
