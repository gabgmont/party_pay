import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppStyles.dart';

class DoubleBigButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const DoubleBigButtonWidget({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.135,
      width: size.width * 0.96,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: size.height * 0.13,
              width: size.width * 0.9,
              color: AppColors.secondary,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Material(
              color: AppColors.primary,
              child: InkWell(
                onTap: onTap,
                highlightColor: AppColors.secondary,
                splashColor: AppColors.secondary,
                child: SizedBox(
                  height: size.height * 0.13,
                  width: size.width * 0.9,
                  child: Center(
                    child: Text(
                      label,
                      style: AppStyles.mainLabel(),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
