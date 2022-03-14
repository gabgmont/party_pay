import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widget/profile_heading.dart';
import 'widget/profiles_text_field.dart';

const profileTitle = 'Profile';
const userLabel = 'User';
const emailLabel = 'E-mail';
const phoneLabel = 'Phone';
const passwordLabel = 'Password';

class ProfilePage extends StatefulWidget {
  final UserModel user;

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
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        title: const Text(profileTitle),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ProfileHeading(
              user: widget.user,
              onEditPressed: () {
                setState(() {
                  active = !active;
                });
              },
              onLogoutPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.remove('token');
                prefs.remove('user');
                prefs.remove('session_id');
                Navigator.pop(context, true);
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
              value: widget.user.email ?? '',
            ),
            IconTextFieldWidget(
              active: active,
              label: passwordLabel,
              icon: Icons.password,
              value: widget.user.secret ?? '',
              hidden: true,
            ),
          ],
        ),
      ),
    );
  }
}
