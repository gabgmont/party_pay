import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/utils/AppColors.dart';

const String prodUrl = 'https://partypay.herokuapp.com';
const String homologUrl = 'https://partypay-homolog.herokuapp.com';
const String url = homologUrl;

class PartyPayService {
  static const String auth = '/auth';
  static const String getMenu = '/menu/{id}';
  static const String getCategory = '/menu/category/{categoryId}';
  static const String getOrder = '/menu/order/{orderId}';
  static const String getRestaurants = '/menu/restaurants';
  static const String getSession = '/session/{sessionId}';
  static const String getUserSession = '/session/user/online/{username}';
  static const String addOrder = '/session/{sessionId}/add/order/{orderId}';
  static const String addUser = '/session/{sessionId}/add/user/username';
  static const String sessionResume = '/session/resume/{sessionId}';
  static const String closeSession = '/session/{sessionId}/close';
  static const String updateOrder = '/session/{sessionId}/update/order/{orderId}/status/{status}';
  static const String createSession = '/session/create';
  static const String getUser = '/user';
  static const String registerUser = '/user/register';
  static const String registerUserSocial = '/user/register/social';

  late SharedPreferences prefs;

  Future<http.Response?> get(String path) async {
    try {
      prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      var uri = Uri.parse(url + path);

      return await http.get(uri, headers: {'Authorization': 'Bearer $token'});
    } on Exception catch (_) {
      return null;
    }
  }

  Future<http.Response?> post(String path, Map<String, dynamic> json) async {
    try {
      prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      var uri = Uri.parse(url + path);
      return await http.post(uri, body: json.toString(), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
    } on Exception catch (_) {
      return null;
    }
  }

  Future<http.Response?> put(String path, Map<String, dynamic>? json) async {
    try {
      prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      var uri = Uri.parse(url + path);

      return await http.put(uri, body: json.toString(), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
    } on Exception catch (_) {
      return null;
    }
  }

  dynamic checkResponse(
      BuildContext context, Response? response, bool showMessages) {
    if (response == null) {
      if (showMessages) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.secondary,
            content: Text('Ocorreu um erro no servidor da aplicacao.'),
          ),
        );
      }
      return null;
    }
    var body = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode != 200) {
      if (showMessages) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.secondary,
            content: Text(body['message']),
          ),
        );
      }
      return null;
    }
    return body;
  }
}

