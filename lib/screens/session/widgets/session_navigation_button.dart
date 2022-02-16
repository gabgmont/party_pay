import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class SessionNavigationButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SessionNavigationButton(
      {Key? key, required this.label, required this.onTap})
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
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.restaurant_menu,
              size: size.height * .05,
              color: AppColors.primary,
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
