import 'package:flutter/material.dart';

import 'widgets/session_page_appbar_widget.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.22),
        child: const SessionPageAppBar(),
      ),
      body: Container(),
    );
  }
}
