import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'header_tile_widget.dart';

const moneyPrefix = 'R\$';

class SessionPageAppBar extends StatelessWidget {
  final int table;
  final String restaurant;
  final double individualValue;
  final double totalValue;

  const SessionPageAppBar(
      {Key? key,
      required this.table,
      required this.restaurant,
      required this.individualValue,
      required this.totalValue})
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
                  restaurant,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: size.height * .035,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HeaderTileWidget(
                    height: size.height * 0.054,
                    icon: Icons.restaurant,
                    data: '$table',
                  ),
                  HeaderTileWidget(
                    height: size.height * 0.054,
                    icon: Icons.person,
                    data: '$moneyPrefix$individualValue',
                  ),
                  HeaderTileWidget(
                    height: size.height * 0.054,
                    icon: Icons.group,
                    data: '$moneyPrefix$totalValue',
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
