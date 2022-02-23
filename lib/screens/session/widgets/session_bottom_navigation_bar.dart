import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'close_session_button.dart';
import 'session_navigation_button.dart';

class SessionBottomNavigationBar extends StatelessWidget {
  final IconData leftButtonIcon;
  final String leftButtonLabel;
  final Color? leftButtonColor;
  final VoidCallback? onLeftButtonTap;
  final IconData rightButtonIcon;
  final String rightButtonLabel;
  final Color? rightButtonColor;
  final VoidCallback? onRightButtonTap;
  final Widget centerButtonLabel;
  final VoidCallback centerButtonTap;

  const SessionBottomNavigationBar({
    Key? key,
    required this.leftButtonIcon,
    required this.leftButtonLabel,
    this.leftButtonColor,
    this.onLeftButtonTap,
    required this.rightButtonIcon,
    required this.rightButtonLabel,
    this.rightButtonColor,
    this.onRightButtonTap,
    required this.centerButtonLabel,
    required this.centerButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .1486,
      width: size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: size.height * .02),
            child: Container(
              height: 1,
              width: size.width * .8,
              color: AppColors.gray,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SessionNavigationButton(
                  label: leftButtonLabel,
                  icon: leftButtonIcon,
                  iconColor: leftButtonColor ?? AppColors.primary,
                  onTap: onLeftButtonTap ??
                      () {
                        Scaffold.of(context).openDrawer();
                      }),
              MainSessionButton(
                label: centerButtonLabel,
                onTap: centerButtonTap,
              ),
              SessionNavigationButton(
                  label: rightButtonLabel,
                  icon: rightButtonIcon,
                  iconColor: rightButtonColor ?? AppColors.primary,
                  onTap: onRightButtonTap ??
                      () {
                        Scaffold.of(context).openEndDrawer();
                      })
            ],
          ),
        ],
      ),
    );
  }
}
