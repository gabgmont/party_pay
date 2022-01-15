import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class DoubleBigButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const DoubleBigButtonWidget({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
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
              child: Container(
                height: size.height * 0.13,
                width: size.width * 0.9,
                color: AppColors.primary,
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                        fontSize: 26,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
