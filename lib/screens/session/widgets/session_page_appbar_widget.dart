import 'package:flutter/material.dart';
import 'package:partypay/screens/create_session/widget/user_round_card_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';

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
                children: [
                  UserRoundCardWidget()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
