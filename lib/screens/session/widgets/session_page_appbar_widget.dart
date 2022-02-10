import 'package:flutter/material.dart';
import 'package:partypay/screens/create_session/widget/user_round_card_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'header_tile_widget.dart';

class SessionPageAppBar extends StatelessWidget {
  const SessionPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.primary,
      height: size.height * 0.22,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Restaurant',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  UserRoundCardWidget(
                    height: size.height * 0.1,
                    width: size.height * 0.1,
                  ),
                  HeaderTileWidget(
                    height: size.height * 0.054,
                    width: size.width * 0.155,
                    icon: Icons.restaurant,
                    data: '0',
                  ),
                  HeaderTileWidget(
                    height: size.height * 0.054,
                    width: size.width * 0.255,
                    icon: Icons.person,
                    data: 'R\$00,00',
                  ),
                  HeaderTileWidget(
                    height: size.height * 0.054,
                    width: size.width * 0.255,
                    icon: Icons.group,
                    data: 'R\$00,00',
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
