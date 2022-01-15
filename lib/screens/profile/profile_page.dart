import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'widget/profile_heading.dart';
import 'widget/profiles_text_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
            ProfileHeading(),
            IconTextFieldWidget(
              label: 'User',
              icon: Icons.person,
            ),
            IconTextFieldWidget(
              label: 'E-mail',
              icon: Icons.mail_outline,
            ),
            IconTextFieldWidget(
              label: 'Phone',
              icon: Icons.phone,
            ),
            IconTextFieldWidget(
              label: 'Password',
              icon: Icons.password,
            ),
          ],
        ),
      ),
    );
  }
}
