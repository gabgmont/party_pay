import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partypay/screens/login/controller/login_controller.dart';
import 'package:partypay/screens/login/widgets/double_button_widget.dart';
import 'package:partypay/screens/login/widgets/double_input_text_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';

import 'widgets/google_sign_in_widget.dart';

const _enter = 'Entrar';
const _register = 'Cadastrar';
const _password = 'Senha';
const _username = 'Usuário/Email';
const _login = 'Login';

class LoginPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginController = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safeAreaSize = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: size.width * 0.78,
                      height: size.height * 0.81,
                      decoration: const BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25))),
                    ),
                    Container(
                      width: size.width * 0.8,
                      height: size.height * 0.80,
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(height: safeAreaSize,),
                            Image.asset(
                              AppImages.logo,
                              width: 150,
                              height: 150,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              _login,
                              style: GoogleFonts.roboto(
                                  fontSize: 48, color: AppColors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DoubleInputTextWidgetWidget(
                              textController: _usernameController,
                              hint: _username,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DoubleInputTextWidgetWidget(
                              textController: _passwordController,
                              hint: _password,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup_page');
                              },
                              child: const Text(
                                _register,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DoubleButtonWidget(
                              label: _enter,
                              onTap: () async {
                                var username = _usernameController.text;
                                var secret = _passwordController.text;
                                _loginController.login(
                                  context,
                                  username,
                                  secret,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(size.height * .05),
                child: GoogleSignInWidget(
                  onTap: () {
                    _loginController.googleSignIn(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
