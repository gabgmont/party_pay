import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widget/profile_heading.dart';
import 'widget/profiles_text_field.dart';

const userLabel = 'User';
const emailLabel = 'E-mail';
const phoneLabel = 'Phone';
const passwordLabel = 'Password';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool active = false;

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
        title: const Text('Profile'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ProfileHeading(
              name: widget.user.name,
              cpf: widget.user.cpf == null ? '' : widget.user.cpf!,
              onEditPressed: () {
                setState(() {
                  active = !active;
                });
              },
              onLogoutPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.remove('token');
                prefs.remove('user');
                Navigator.pushReplacementNamed(context, '/login_page');
              },
            ),
            IconTextFieldWidget(
              active: active,
              label: userLabel,
              icon: Icons.person,
              value: widget.user.name,
            ),
            IconTextFieldWidget(
              active: active,
              label: emailLabel,
              icon: Icons.mail_outline,
              value: widget.user.email == null ? '' : widget.user.email!,
            ),
            IconTextFieldWidget(
              active: active,
              label: phoneLabel,
              icon: Icons.phone,
              value: widget.user.phone == null ? '' : widget.user.phone!,
            ),
            IconTextFieldWidget(
              active: active,
              label: passwordLabel,
              icon: Icons.password,
              value: widget.user.secret == null ? '' : widget.user.secret!,
              hidden: true,
            ),
          ],
        ),
      ),
    );
  }
}
