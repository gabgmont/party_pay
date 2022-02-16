import 'package:flutter/material.dart';

import '../widgets/menu_order_widget.dart';
import '../widgets/session_header_widget.dart';

class SessionMenuDrawer extends StatelessWidget {
  const SessionMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safeAreaHeight = MediaQuery.of(context).padding.top;

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            SessionHeaderWidget(
              label: 'Outback',
              leading: Icons.restaurant_menu,
              showTrailing: false,
            ),
            SizedBox(
              height: size.height * .94 - safeAreaHeight,
              child: ListView(
                children: [
                  MenuOrderWidget(
                    label: 'Lanchão brabo',
                    description: 'Feito com amor',
                    price: 20.0,
                  ),
                  MenuOrderWidget(
                    label: 'Pizzinha braba',
                    description: 'Feita com carinho',
                    price: 402.0,
                  ),
                  MenuOrderWidget(
                    label: 'Pastelzão da massa',
                    description: 'Cheio de prazer',
                    price: 15.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
