import 'package:flutter/material.dart';

import '../widgets/session_bottom_navigation_bar.dart';
import '../widgets/session_order_widget.dart';
import '../widgets/session_header_widget.dart';

class SessionBody extends StatefulWidget {
  const SessionBody({Key? key}) : super(key: key);

  @override
  State<SessionBody> createState() => _SessionBodyState();
}

class _SessionBodyState extends State<SessionBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SessionHeaderWidget(
          label: 'Orders',
          leading: Icons.list,
          showTrailing: true,
        ),
        Container(
          height: size.height * .61,
          child: ListView(
            children: [
              SessionOrderWidget(),
              SessionOrderWidget(),
              SessionOrderWidget(),
              SessionOrderWidget(),
              SessionOrderWidget(),
            ],
          ),
        ),
        SessionBottomNavigationBar(
          closeButtonTap: () {
            setState(() {});
          },
        )
      ],
    );
  }
}
