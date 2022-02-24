import 'package:flutter/material.dart';
import 'package:partypay/model/session/session_order_model.dart';
import 'package:partypay/model/session/session_user_model.dart';

import '../widgets/individual_resume_item_widget.dart';
import '../widgets/resume_header_widget.dart';

const myResume = 'Meu Resumo';

class IndividualResumePage extends StatelessWidget {
  final SessionUserModel sessionUserModel;
  final List<SessionOrderModel> sessionOrderModel;

  const IndividualResumePage(
      {Key? key,
      required this.sessionUserModel,
      required this.sessionOrderModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        ResumeHeaderWidget(
          label: myResume,
        ),
        SizedBox(
          height: size.height * .6,
          child: ListView(
            children: getUserOrders(),
          ),
        ),
      ],
    );
  }

  List<IndividualResumeItem> getUserOrders(){
    var userOrders = sessionOrderModel.where((element) => element.userList.contains(sessionUserModel.user));

    return userOrders.map((sessionOrder) => IndividualResumeItem(sessionOrder: sessionOrder,)).toList();
  }

}
