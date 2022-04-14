import 'package:flutter/material.dart';
import 'package:partypay/screens/session/controller/session_controller.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppStyles.dart';

import 'header_tile_widget.dart';

const moneyPrefix = 'R\$';

class SessionPageAppBar extends StatelessWidget {
  final SessionController sessionController;

  const SessionPageAppBar(
      {Key? key,
      required this.sessionController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.primary,
      height: size.height * .22,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  sessionController.sessionModel.restaurant,
                  style: AppStyles.mainLabel(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HeaderTileWidget(
                    height: size.height * 0.054,
                    icon: Icons.restaurant,
                    data: '${sessionController.sessionModel.table}',
                  ),
                  HeaderTileWidget(
                    height: size.height * 0.054,
                    icon: Icons.person,
                    data: '$moneyPrefix${sessionController.getLoggedUserValue()}',
                  ),
                  HeaderTileWidget(
                    height: size.height * 0.054,
                    icon: Icons.group,
                    data: '$moneyPrefix${sessionController.getTotalValue()}',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
