import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppStyles.dart';

import '../../../model/session/session_user_model.dart';
import '../../../shared/utils/AppColors.dart';
import 'group_resume_item_widget.dart';

class GroupUserResumeWidget extends StatelessWidget {
  final SessionUserModel sessionUserModel;

  const GroupUserResumeWidget({Key? key, required this.sessionUserModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * .95,
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.primary, width: 1),
          ),
        ),
        child: Column(
          children: [
            Container(
              color: AppColors.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width *.6,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          sessionUserModel.user.name,
                          style: AppStyles.orderName(color: AppColors.white),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 1,
                          height: 24,
                          color: AppColors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            width: 40,
                            child: Icon(
                              Icons.person,
                              color: AppColors.white,
                              size: 24,
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 24,
                          color: AppColors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            width: 40,
                            child: Icon(
                              Icons.groups,
                              color: AppColors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: getResumeItens(),
            ),
            Container(
              height: 30,
              color: AppColors.primary,
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: "Total: ",
                    style: AppStyles.orderName(color: AppColors.white),
                    children: [
                      TextSpan(
                        text: "R\$${getUserTotal().toStringAsFixed(2)}",
                        style: AppStyles.orderName(color: AppColors.white),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double getUserTotal() {
    double total = 0.0;
    for (var order in sessionUserModel.orders) {
      total += order.valuePerUser;
    }
    return total;
  }

  List<GroupResumeItemWidget> getResumeItens() {
    return sessionUserModel.orders
        .map((e) => GroupResumeItemWidget(orderModel: e))
        .toList();
  }
}
