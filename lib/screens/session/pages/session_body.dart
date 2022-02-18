import 'package:flutter/material.dart';
import 'package:partypay/screens/session/controller/session_controller.dart';

import '../widgets/alert_widget.dart';
import '../widgets/session_bottom_navigation_bar.dart';
import '../widgets/session_order_widget.dart';
import '../widgets/session_header_widget.dart';

class SessionBody extends StatefulWidget {
  final SessionController sessionController;

  const SessionBody({Key? key, required this.sessionController})
      : super(key: key);

  @override
  State<SessionBody> createState() => _SessionBodyState();
}

class _SessionBodyState extends State<SessionBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var sessionOrders = getSessionOrders();

    return Column(
      children: [
        const SessionHeaderWidget(
          label: 'Orders',
          leading: Icons.list,
          showTrailing: true,
        ),
        SizedBox(
          height: size.height * .61,
          child: sessionOrders.isEmpty
              ? const AlertWidget(
                  message: 'Faça um pedido clicando no Menu!',
                  icon: Icons.lunch_dining)
              : ListView(children: sessionOrders),
        ),
        SessionBottomNavigationBar(
          closeButtonTap: () {
            setState(() {});
          },
        )
      ],
    );
  }

  List<SessionOrderWidget> getSessionOrders() {
    return widget.sessionController.sessionModel.sessionOrderList
        .map((model) => SessionOrderWidget(sessionOrderModel: model))
        .toList();
  }
}
