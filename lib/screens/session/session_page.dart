import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'widgets/close_session_button.dart';
import 'widgets/order_card_widget.dart';
import 'widgets/order_header_widget.dart';
import 'widgets/session_navigation_button.dart';
import 'widgets/session_page_appbar_widget.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .13),
        child: const SessionPageAppBar(),
      ),
      body: Column(
        children: [
          OrderHeaderWidget(),
          Container(
            width: size.width * .95,
            height: size.height * .61,
            child: ListView(
              children: [
                OrderCardWidget(),
                OrderCardWidget(),
                OrderCardWidget(),
                OrderCardWidget(),
                OrderCardWidget(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * .1486,
        width: size.width,
        child: Column(
          children: [
            Divider(
              indent: size.width * .08,
              endIndent: size.width * .08,
              thickness: 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SessionNavigationButton(
                  label: 'Menu',
                  onTap: () {},
                ),
                CloseSessionButton(
                  onTap: () {},
                ),
                SessionNavigationButton(
                  label: 'Users',
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
