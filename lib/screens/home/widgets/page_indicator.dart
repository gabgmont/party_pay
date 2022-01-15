import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class PageIndicator extends StatelessWidget {
  final Color color;

  const PageIndicator({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: AppColors.gray,
              blurStyle: BlurStyle.outer,
            )
          ],
        ),
      ),
    );
  }
}
