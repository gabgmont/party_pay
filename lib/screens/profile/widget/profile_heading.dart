import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/screens/create_session/widget/user_round_card_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppStyles.dart';
import 'package:partypay/shared/utils/string_filter.dart';

class ProfileHeading extends StatelessWidget {
  final VoidCallback onEditPressed;
  final VoidCallback onLogoutPressed;
  final UserModel user;

  const ProfileHeading({
    Key? key,
    required this.onEditPressed,
    required this.onLogoutPressed,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                offset: Offset.fromDirection(1.5),
                blurRadius: 0.5,
                spreadRadius: 0.5,
                color: AppColors.shadow)
          ]),
          child: Material(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        color: AppColors.primary,
                        splashRadius: 25,
                        icon: const Icon(
                          Icons.edit,
                          size: 36,
                        ),
                        onPressed: onEditPressed,
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      color: AppColors.red,
                      splashRadius: 25,
                      icon: const Icon(
                        Icons.logout,
                        size: 36,
                      ),
                      onPressed: onLogoutPressed,
                    ),
                  ),
                  const SizedBox(),
                  SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          StringFilter.getFirstName(user.name),
                          style: AppStyles.profileField(false),
                        ),
                        Text(
                          user.username ?? '',
                          style: AppStyles.profileField(false),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: UserRoundCardWidget(
                      height: size.height * 0.15,
                      width: size.height * 0.15,
                      initials: user.getInitials(),
                      photo: user.photo,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
