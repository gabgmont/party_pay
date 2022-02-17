import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import '../widgets/session_header_widget.dart';
import '../widgets/session_user_card.dart';

class SessionUsersEndDrawer extends StatefulWidget {
  final List<UserModel> users;

  const SessionUsersEndDrawer({Key? key, required this.users})
      : super(key: key);

  @override
  State<SessionUsersEndDrawer> createState() => _SessionUsersEndDrawerState();
}

class _SessionUsersEndDrawerState extends State<SessionUsersEndDrawer> {
  List<SessionUserCard> userCardList = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safeAreaHeight = MediaQuery.of(context).padding.top;
    init(widget.users);

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: SessionHeaderWidget(
                label: 'Users',
                leading: Icons.groups,
                showTrailing: true,
              ),
            ),
            SizedBox(
              height: size.height * 0.94 - safeAreaHeight - 8,
              child: ListView(
                children: userCardList,
              ),
            ),
          ],
        ),
      ),
    );
  }

  init(List<UserModel> users) {
    userCardList = users.map((userModel) => SessionUserCard(user: userModel)).toList();
  }
}
