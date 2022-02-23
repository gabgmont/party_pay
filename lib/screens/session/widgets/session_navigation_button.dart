import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class SessionNavigationButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const SessionNavigationButton(
      {Key? key,
      required this.label,
      required this.onTap,
      required this.icon,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .09,
      child: Column(
        children: [
          IconButton(
            onPressed: onTap,
            highlightColor: AppColors.secondary,
            splashRadius: size.height * .035,
            splashColor: AppColors.secondary,
            padding: EdgeInsets.zero,
            icon: Icon(
              icon,
              size: size.height * .05,
              color: iconColor,
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: size.height * .017),
          )
        ],
      ),
    );
  }
}
