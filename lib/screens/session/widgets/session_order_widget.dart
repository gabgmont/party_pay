import 'package:flutter/material.dart';
import 'package:partypay/screens/create_session/widget/user_round_card_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class SessionOrderWidget extends StatelessWidget {
  const SessionOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                            border: Border.fromBorderSide(BorderSide(
                                color: AppColors.secondary, width: 1)),
                            borderRadius: BorderRadius.circular(size.height)),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Name',
                              style: TextStyle(fontSize: size.height * .02),
                            ),
                            Text(
                              'Description',
                              style: TextStyle(
                                  color: AppColors.gray,
                                  fontSize: size.height * .015),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'R\$00.00',
                          style: TextStyle(fontSize: size.height * .02),
                        ),
                        Text(
                          'R\$00.00',
                          style: TextStyle(fontSize: size.height * .015),
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
                padding: const EdgeInsets.all(4.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    UserRoundCardWidget(
                      width: size.height * .04,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
