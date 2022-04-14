import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partypay/model/session/session_order_model.dart';
import 'package:partypay/model/session/session_user_model.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppStyles.dart';

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
        const ResumeHeaderWidget(
          label: myResume,
        ),
        Container(
          height: size.height * .045,
          width: 170,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(200)),
          child: Center(
            child: Text.rich(
              TextSpan(
                text: "Total: ",
                style: AppStyles.mainLabel(),
                children: [
                  TextSpan(
                    text: "R\$${getUserTotal().toStringAsFixed(2)}",
                    style: GoogleFonts.reemKufi(color: AppColors.white, fontSize: 18),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * .54,
          child: ListView(
            children: getUserOrders(),
          ),
        ),
      ],
    );
  }

  double getUserTotal() {
    double total = 0.0;
    getUserOrders().forEach((order) {
      total += order.sessionOrder.valuePerUser;
    });
    return total;
  }

  List<IndividualResumeItem> getUserOrders() {
    var userOrders = sessionOrderModel
        .where((element) => element.userList.contains(sessionUserModel.user));

    return userOrders
        .map((sessionOrder) => IndividualResumeItem(
              sessionOrder: sessionOrder,
            ))
        .toList();
  }
}
