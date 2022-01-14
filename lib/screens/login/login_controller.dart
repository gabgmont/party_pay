import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partypay/model/auth/auth_model.dart';
import 'package:partypay/rest/partypay_api_service.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class LoginController {
  final PartyPayService service = PartyPayService();

  AuthenticationModel? getAuthModel(String email, String secret) {
    if (email != '' && secret != '') {
      return AuthenticationModel(email, secret);
    } else {
      return null;
    }
  }

  Future<bool> login(BuildContext context, AuthenticationModel auth) async {
    var response = await service.post(PartyPayService.auth, auth.toJson());
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
    return true;
  }
}
