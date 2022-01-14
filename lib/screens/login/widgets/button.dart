import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class DoubleButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const DoubleButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: size.height * 0.05,
        width: size.width * 0.5,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: size.height * 0.045,
                width: size.width * 0.49,
                color: AppColors.secondary,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: size.height * 0.045,
                width: size.width * 0.49,
                color: AppColors.white,
                child: Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 22,
                      color: AppColors.primary,
                    ),
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
