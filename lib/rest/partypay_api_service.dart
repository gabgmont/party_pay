import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String url = 'https://partypay.herokuapp.com';

class PartyPayService {
  static const String auth = '/auth';
  static const String getMenu = '/menu/{restaurant}';
  static const String getCategory = '/menu/{restaurant}/category/{category}';
  static const String getOrder = '/menu/{restaurant}/order/{order}';
  static const String getSession = '/session/{sessionId}';
  static const String addOrder = '/session/{sessionId}/add/order/{orderName}';
  static const String addUser = '/session/{sessionId}/add/user/cpf';
  static const String closeSession = '/session/{sessionId}/close';
  static const String updateOrder = '/session/{sessionId}/update/order/{orderId}/status/{status}';
  static const String createSession = '/session/create';
  static const String getUser = '/user';
  static const String registerUser = '/user/register';

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
}
