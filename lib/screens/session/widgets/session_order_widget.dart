import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partypay/model/session/session_order_model.dart';
import 'package:partypay/screens/create_session/widget/user_round_card_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppStyles.dart';

const moneyPrefix = 'R\$';

class SessionOrderWidget extends StatelessWidget {
  final SessionOrderModel sessionOrderModel;

  const SessionOrderWidget({Key? key, required this.sessionOrderModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final totalValue = (sessionOrderModel.order.value).toStringAsFixed(2);
    final valuePerUser =
        (sessionOrderModel.order.value / sessionOrderModel.userList.length)
            .toStringAsFixed(2);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Container(
        height: size.height * .17,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(size.width * .05),
          border: const Border.fromBorderSide(
            BorderSide(color: AppColors.primary, width: 1),
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.shadow,
                offset: Offset.fromDirection(1),
                blurRadius: .5,
                spreadRadius: .5)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(size.height * .015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: size.height * .085,
                        width: size.height * .085,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(sessionOrderModel.order.image), fit: BoxFit.fill),
                          border: const Border.fromBorderSide(
                            BorderSide(color: AppColors.secondary, width: 1),
                          ),
                          borderRadius: BorderRadius.circular(size.height),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .03),
                        child: SizedBox(
                          width: size.width * .45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sessionOrderModel.order.name,
                                style: AppStyles.orderName(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$moneyPrefix$totalValue',
                          style: GoogleFonts.reemKufi(fontSize: 16),
                        ),
                        Text(
                          '$moneyPrefix$valuePerUser',
                          style: GoogleFonts.reemKufi(fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * .05,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.width * .04),
                  bottomRight: Radius.circular(size.width * .04),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: getOrderUsers(size),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<UserRoundCardWidget> getOrderUsers(Size size) {
    return sessionOrderModel.userList
        .map((e) => UserRoundCardWidget(
              height: size.height * .04,
              width: size.height * .04,
              initials: e.getInitials(),
              photo: e.photo,
            ))
        .toList();
  }
}
