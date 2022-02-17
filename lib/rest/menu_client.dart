import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:partypay/model/session/menu_model.dart';

import '../shared/utils/AppColors.dart';
import 'partypay_api_service.dart';

class MenuClient {
  final _service = PartyPayService();

  Future<MenuModel?> getMenu(BuildContext context, String restaurant) async {
    var url = PartyPayService.getMenu.replaceAll('{restaurant}', restaurant);
    print('URL ----------------- $url');
    var response = await _service.get(url);
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
    print('BODY ------------------ $body');
    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(body['message']),
        ),
      );
      return null;
    }

    return MenuModel.fromJson(body);
  }
}
