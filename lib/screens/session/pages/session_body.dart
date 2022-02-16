import 'package:flutter/material.dart';

import '../widgets/session_order_widget.dart';
import '../widgets/session_header_widget.dart';

class SessionBody extends StatelessWidget {
  const SessionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SessionHeaderWidget(
          label: 'Order',
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
        )
      ],
    );
  }
}
