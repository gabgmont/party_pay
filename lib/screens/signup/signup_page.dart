import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/rest/client/user_client.dart';
import 'package:partypay/screens/login/widgets/double_button_widget.dart';
import 'package:partypay/screens/login/widgets/double_input_text_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';

const _signupLabel = 'Cadastrar';
const _confirmButtonLabel = 'Confirmar';
const _nameLabel = 'Nome';
const _userLabel = 'Usuário';
const _emailLabel = 'Email';
const _passwordLabel = 'Senha';
const _confirmPasswordLabel = 'Confirmar Senha';
const _fillName = 'Preencha o nome.';
const _fillUser = 'Preencha o usuário.';
const _fillEmail = 'Preencha o email.';
const _fillPassword = 'Preencha a senha.';
const _fillConfirmPassword = 'Senhas não conferem.';
const _serverError = 'Ocorreu um erro no servidor da aplicacao.';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameTextController = TextEditingController();
  final _userTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();
  final _userClient = UserClient();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final safeAreaHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Center(
            child: SizedBox(
              height: size.height - safeAreaHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AppImages.logo,
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    _signupLabel,
                    style: TextStyle(color: AppColors.white, fontSize: 48),
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.person,
                          color: AppColors.white,
                          size: 48,
                        ),
                      ),
                      DoubleInputTextWidgetWidget(
                          hint: _nameLabel, textController: _nameTextController)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.badge,
                          color: AppColors.white,
                          size: 48,
                        ),
                      ),
                      DoubleInputTextWidgetWidget(
                          hint: _userLabel, textController: _userTextController)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.mail,
                          color: AppColors.white,
                          size: 48,
                        ),
                      ),
                      DoubleInputTextWidgetWidget(
                          hint: _emailLabel,
                          textController: _emailTextController)
                    ],
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.password,
                            color: AppColors.white,
                            size: 48,
                          )),
                      DoubleInputTextWidgetWidget(
                        hint: _passwordLabel,
                        textController: _passwordTextController,
                        obscureText: true,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.password,
                          color: AppColors.white,
                          size: 48,
                        ),
                      ),
                      DoubleInputTextWidgetWidget(
                        hint: _confirmPasswordLabel,
                        textController: _confirmPasswordTextController,
                        obscureText: true,
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * .1,
                  ),
                  DoubleButtonWidget(
                    label: _confirmButtonLabel,
                    onTap: () async {
                      await registerUser(context);
                    },
                  ),
                  SizedBox(
                    height: size.height * .1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> registerUser(BuildContext context) async {
    if(_nameTextController.text.isEmpty) {
      showMessage(context, _fillName);
      return false;
    }
    if(_userTextController.text.isEmpty) {
      showMessage(context, _fillUser);
      return false;
    }
    if(_emailTextController.text.isEmpty) {
      showMessage(context, _fillEmail);
      return false;
    }
    if(_passwordTextController.text.isEmpty) {
      showMessage(context, _fillPassword);
      return false;
    }

    if (_passwordTextController.text !=
        _confirmPasswordTextController.text) {
      showMessage(context, _fillConfirmPassword);
      return false;
    }

    var _userModel = UserModel(
      name: _nameTextController.text,
      username: _userTextController.text,
      email: _emailTextController.text,
    );
    _userModel.secret = _passwordTextController.text;
    var user = await _userClient.registerUser(context, _userModel);
    if(user == null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.secondary,
          content: Text(_serverError),
        ),
      );
      return false;
    }
    Navigator.pop(context);
    return true;
  }

  void showMessage(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.secondary,
        content: Text(message),
      ),
    );
  }
}
