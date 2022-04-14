import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppStyles.dart';

import '../../create_session/widget/user_round_card_widget.dart';

class SessionUserCard extends StatelessWidget {
  final UserModel user;

  const SessionUserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          Row(
            children: [
              UserRoundCardWidget(
                height: size.height * .075,
                width: size.height * .075,
                initials: user.getInitials(),
                photo: user.photo,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  user.name,
                  overflow: TextOverflow.clip,
                  style: AppStyles.mainLabel(color: AppColors.black),
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            indent: size.width * .04,
            endIndent: size.width * .04,
          )
        ],
      ),
    );
  }
}
