import 'package:flutter/material.dart';
import 'package:partypay/screens/session/controller/session_controller.dart';

import '../../../shared/utils/AppColors.dart';
import '../widgets/alert_widget.dart';
import '../widgets/session_bottom_navigation_bar.dart';
import '../widgets/session_header_widget.dart';
import '../widgets/session_order_widget.dart';

const clickMenuToOrder = 'Faça um pedido clicando no Menu!';
const ordersLabel = 'Pedidos';
const menuLabel = 'Cardápio';
const usersLabel = 'Usuários';

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
          label: ordersLabel,
          leading: Icons.list,
          showTrailing: false,
        ),
        SizedBox(
          height: size.height * .61,
          child: sessionOrders.isEmpty
              ? const AlertWidget(
                  message: clickMenuToOrder,
                  icon: Icons.lunch_dining)
              : ListView(children: sessionOrders),
        ),
        SessionBottomNavigationBar(
          leftButtonLabel: menuLabel,
          leftButtonIcon: Icons.restaurant_menu,
          rightButtonLabel: usersLabel,
          rightButtonIcon: Icons.groups,
          centerButtonLabel: Text.rich(
            TextSpan(
              text: 'Encerrar\n',
              style: TextStyle(
                color: AppColors.white,
                fontSize: size.height * .033,
              ),
              children: [
                TextSpan(
                  text: 'Sessão',
                  style: TextStyle(
                      color: AppColors.white, fontSize: size.height * .028),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
          centerButtonTap: () async {
            Navigator.pushNamed(context, 'resume_page');
            // var sucess = await widget.sessionController.closeSession(context);
            // if (sucess) {
            //   var prefs = await SharedPreferences.getInstance();
            //   prefs.remove('session_id');
            //
            //   Navigator.of(context).pushNamedAndRemoveUntil(
            //       '/home_page', (Route<dynamic> route) => false,
            //       arguments: widget.sessionController.sessionModel.userList[0]);
            // }
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
