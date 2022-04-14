import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import '../../../shared/utils/AppStyles.dart';

class SessionHeaderWidget extends StatelessWidget {
  final String label;
  final IconData leading;
  final bool showTrailing;
  final VoidCallback? onTap;

  const SessionHeaderWidget({
    Key? key,
    required this.label,
    required this.showTrailing,
    required this.leading,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .06,
      width: size.width,
      color: AppColors.secondary,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    leading,
                    color: AppColors.white,
                    size: size.height * .05,
                  ),
                ),
                Text(
                  label,
                  style: AppStyles.mainLabel()),
              ],
            ),
            showTrailing
                ? IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.add,
                      color: AppColors.white,
                      size: size.height * .05,
                    ),
                    onPressed: onTap,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
