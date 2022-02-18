import 'package:flutter/material.dart';

import '../../../shared/utils/AppColors.dart';

class AlertWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const AlertWidget({Key? key, required this.message, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.width * .2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              color: AppColors.primary,
              size: size.height * .1,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.height * .03,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
