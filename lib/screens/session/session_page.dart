import 'package:flutter/material.dart';

import 'widgets/order_card_widget.dart';
import 'widgets/order_header_widget.dart';
import 'widgets/session_bottom_navigation_bar.dart';
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
      bottomNavigationBar: SessionBottomNavigationBar(
        leftButtonTap: () {},
        closeButtonTap: () {},
        rightButtonTap: () {},
      ),
    );
  }
}
