import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:partypay/model/session/menu_model.dart';

import '../controller/session_controller.dart';
import '../widgets/category_drop_down_widget.dart';
import '../widgets/menu_order_widget.dart';
import 'add_order_button_bottom_sheet.dart';
import '../widgets/session_header_widget.dart';

class SessionMenuDrawer extends StatefulWidget {
  final MenuModel menu;
  final SessionController sessionController;
  final VoidCallback onConfirmOrder;

  const SessionMenuDrawer({
    Key? key,
    required this.menu,
    required this.sessionController,
    required this.onConfirmOrder,
  }) : super(key: key);

  @override
  State<SessionMenuDrawer> createState() => _SessionMenuDrawerState();
}

class _SessionMenuDrawerState extends State<SessionMenuDrawer> {
  var dropDownList = <CategoryDropDown>[];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safeAreaHeight = MediaQuery.of(context).padding.top;
    init(widget.menu);

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            SessionHeaderWidget(
              label: widget.menu.name,
              leading: Icons.restaurant_menu,
              showTrailing: false,
            ),
            SizedBox(
              height: size.height * .94 - safeAreaHeight,
              child: ListView(
                children: dropDownList,
              ),
            )
          ],
        ),
      ),
    );
  }

  init(MenuModel menu) {
    var categoryWidgetList = menu.categoryList.map((category) {
      var orderWidgetList = category.orderList
          .map((order) => MenuOrderWidget(
                label: order.name,
                image: order.image,
                description: order.description,
                price: order.value,
                onTap: () {
                  Modular.to.pop();
                  Scaffold.of(context).showBottomSheet(
                    (context) => AddOrderButtonBottomSheet(
                      orderName: order.name,
                      orderId: order.orderId,
                      sessionController: widget.sessionController,
                      userList: widget.sessionController.sessionModel.userList,
                        onConfirmOrder: widget.onConfirmOrder
                    ),
                  );
                },
              ))
          .toList();
      return CategoryDropDown(
        label: category.name,
        orderItemList: orderWidgetList,
        opTap: () {
          setState(() {});
        },
      );
    }).toList();
    dropDownList = categoryWidgetList;
  }
}
