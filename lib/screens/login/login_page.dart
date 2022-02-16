import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partypay/rest/user_client.dart';
import 'package:partypay/screens/login/login_controller.dart';
import 'package:partypay/screens/login/widgets/double_button_widget.dart';
import 'package:partypay/screens/login/widgets/double_input_text_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';

const enter = 'Entrar';
const forgotPassword = 'Esqueci a senha';
const password = 'Senha';
const username = 'CPF';
const login = 'Login';
const String welcome = 'Bem Vindo!';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginController = LoginController();
  final userService = UserClient();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Align(
            alignment: Alignment.topRight,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: size.width * 0.78,
                  height: size.height * 0.81,
                  decoration: const BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(25))),
                ),
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.8,
                  decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.logo,
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          login,
                          style: GoogleFonts.roboto(
                              fontSize: 48, color: AppColors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DoubleInputTextWidgetWidget(
                          textController: usernameController,
                          hint: username,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DoubleInputTextWidgetWidget(
                          textController: passwordController,
                          hint: password,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          forgotPassword,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DoubleButtonWidget(
                          label: enter,
                          onTap: () async {
                            var cpf = usernameController.text;
                            var secret = passwordController.text;
                            loginController.login(
                              context,
                              cpf,
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
        ),
      ),
    );
  }
}
