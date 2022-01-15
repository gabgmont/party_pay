import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'widget/profile_heading.dart';
import 'widget/profiles_text_field.dart';

const userLabel = 'User';
const emailLabel = 'E-mail';
const phoneLabel = 'Phone';
const passwordLabel = 'Password';

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Profile'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ProfileHeading(
              name: user.name,
              cpf: user.cpf == null ? '' : user.cpf!,
            ),
            IconTextFieldWidget(
              label: userLabel,
              icon: Icons.person,
            ),
            IconTextFieldWidget(
              label: emailLabel,
              icon: Icons.mail_outline,
            ),
            IconTextFieldWidget(
              label: phoneLabel,
              icon: Icons.phone,
            ),
            IconTextFieldWidget(
              label: passwordLabel,
              icon: Icons.password,
            ),
          ],
        ),
      ),
    );
  }
}
