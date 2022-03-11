import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/utils/AppColors.dart';
import '../../../shared/utils/AppImages.dart';

class GoogleSignInWidget extends StatelessWidget {
  final VoidCallback onTap;

  const GoogleSignInWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: 62,
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 61,
            width: 61,
            decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(200)),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Material(
            borderRadius: BorderRadius.circular(200),
            color: AppColors.lightGray,
            child: InkWell(
              borderRadius: BorderRadius.circular(200),
              onTap: onTap,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    AppImages.google,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
