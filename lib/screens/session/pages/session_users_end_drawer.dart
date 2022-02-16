import 'package:flutter/material.dart';
import 'package:partypay/screens/create_session/widget/user_round_card_widget.dart';

import '../widgets/session_header_widget.dart';

class SessionUsersEndDrawer extends StatelessWidget {
  const SessionUsersEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safeAreaHeight = MediaQuery.of(context).padding.top;

    return SafeArea(
      child: Drawer(
        child: SizedBox(
          height: size.height * 0.94 - safeAreaHeight,
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: SessionHeaderWidget(
                  label: 'Users',
                  leading: Icons.groups,
                  showTrailing: false,
                ),
              ),
              _SessionUserCard(),
              _SessionUserCard(),
              _SessionUserCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SessionUserCard extends StatelessWidget {
  const _SessionUserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 4.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                UserRoundCardWidget(
                  height: size.height * .075,
                  width: size.height * .075,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Fulano de tal',
                    style: TextStyle(fontSize: size.height * .02),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              indent: size.width * .04,
              endIndent: size.width * .04,
            )
          ],
        ),
      ),
    );
  }
}

