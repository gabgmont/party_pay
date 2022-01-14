import 'dart:convert';

import 'package:http/http.dart' as http;

const String url = 'https://partypay.herokuapp.com/';

class PartyPayService {
  static const String auth = 'auth';
  static const String getRestaurant = 'menu/{restaurant}/';
  static const String getCategory = 'menu/{restaurant}/category/{category}/';
  static const String getOrder = 'menu/{restaurant}/order/{order}/';
  static const String getSession = 'session/{sessionId}/';
  static const String addOrder = 'session/{sessionId}/add/order/{orderName}/';
  static const String addUser = 'session/{sessionId}/add/user/{cpf}/';
  static const String closeSession = 'session/{sessionId}/close/';
  static const String updateOrder =
      'session/{sessionId}/update/order/{orderId}/status/{status}/';
  static const String createSession = 'session/create/';
  static const String getUser = 'user/';
  static const String registerUser = 'user/register/';

  Future<Map> get(String path) async {
    var uri = Uri.parse(url + path);

    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    return json;
  }

  Future<http.Response> post(String path, Map<String, dynamic> json) async {
    var uri = Uri.parse(url + path);
    print(json);
    var response = await http.post(uri,
        body: json.toString(), headers: {'Content-Type': 'application/json'});

    return response;
  }
}
