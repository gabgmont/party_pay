import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:partypay/model/auth/auth_model.dart';
import 'package:partypay/partypay_module.dart';
import 'package:partypay/rest/client/user_client.dart';
import 'package:partypay/rest/partypay_api_service.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _fillAllFields = 'Preencha todos os campos.';
const _loginError = 'Erro ao realizar login.';
const _socialSecret = 'Qa#9#eMLNx3?JR3.2zr~v)gYF^88>XfBWw75Nemt9YjbQMNCWwW';

class LoginController {
  final PartyPayService _service = PartyPayService();
  final UserClient _userService = UserClient();

  Future<bool> login(
      BuildContext context, String username, String secret) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (username == '' || secret == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(
            _fillAllFields,
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
      return false;
    }

    await _generateToken(context, username, secret);

    var user = await _userService.getUser(context, username);
    _prefs.setString('user', user!.toJson().toString());

    Modular.to.pushReplacementNamed(routeToHomePage, arguments: user);

    return true;
  }

  Future<void> googleSignIn(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      if (response == null) throw Exception();

      var hasToken =
          await _generateToken(context, response.email, _socialSecret);

      if (hasToken) {
        var user = await _userService.getUser(context, response.email);
        _prefs.setString('user', user!.toJson().toString());
        Modular.to.pushReplacementNamed(routeToHomePage, arguments: user);
        return;
      }

      var user = await _userService.registerSocialUser(context,
          response.displayName!, response.email, response.photoUrl ?? "");

      if (user == null) return;
      _generateToken(context, user.email!, _socialSecret);
      _prefs.setString('user', user.toJson().toString());
      Modular.to.pushReplacementNamed(routeToHomePage, arguments: user);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(_loginError),
        ),
      );
    }
  }

  Future<bool> _generateToken(
      BuildContext context, String username, String secret) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var authJson = AuthenticationModel(username, secret).toJson();
    var response = await _service.post(PartyPayService.auth, authJson);

    var body = _service.checkResponse(context, response, true);
    if (body == null) return false;

    _prefs.setString('token', body['token']);
    return true;
  }
}
