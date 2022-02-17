import 'package:flutter/material.dart';
import 'package:partypay/model/session/menu_model.dart';

import '../widgets/category_drop_down_widget.dart';
import '../widgets/menu_order_widget.dart';
import '../widgets/session_header_widget.dart';

class SessionMenuDrawer extends StatefulWidget {
  final MenuModel menu;

  const SessionMenuDrawer({Key? key, required this.menu}) : super(key: key);

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
                description: order.description,
                price: order.value,
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
