import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';

import '../partypay_api_service.dart';

class UserClient {
  final _service = PartyPayService();

  Future<UserModel?> getUser(BuildContext context, String username) async {
    var path = PartyPayService.getUser + '?username=$username';

    var response = await _service.get(path);
    var body = _service.checkResponse(context, response, true);
    if (body == null) return null;

    return UserModel.fromJson(body[0]);
  }

  Future<UserModel?> registerSocialUser(
      BuildContext context, String name, String email, String photoUrl) async {
    var json = {'"name"': '"$name"', '"email"': '"$email"', '"photo"': '"$photoUrl"'};

    var response = await _service.post(PartyPayService.registerUserSocial, json);
    var body = _service.checkResponse(context, response, true);
    if (body == null) return null;

    return UserModel.fromJson(body);
  }
}
