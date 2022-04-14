import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';
import 'package:shared_preferences/shared_preferences.dart';

const logoName = 'PartyPay!';
const catchPhrase = 'Share your Bills.';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then(
            (value) => checkLogin(context));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 15),
            Text(
              logoName,
              style: GoogleFonts.reemKufi(
                  fontSize: 36, color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
            Text(
              catchPhrase,
              style:
              GoogleFonts.reemKufi(fontSize: 24, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}

void checkLogin(BuildContext context) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var user = prefs.getString('user');

  if (token == null || user == null) {
    prefs.remove('token');
    prefs.remove('user');
    Navigator.pushReplacementNamed(context, '/login_page');

    return;
  }

  var userMap = jsonDecode(user);
  var userModel = UserModel(
      name: userMap['name'],
      username: userMap['username'],
      email: userMap['email'],
      photo: userMap['photo']);

  Navigator.pushReplacementNamed(context, '/home_page', arguments: userModel);
}
