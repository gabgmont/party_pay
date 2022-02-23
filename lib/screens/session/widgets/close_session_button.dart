import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class MainSessionButton extends StatelessWidget {
  final Widget label;
  final VoidCallback onTap;

  const MainSessionButton({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(size.width * .15),
      topRight: Radius.circular(size.width * .15),
      bottomLeft: Radius.circular(size.width * .08),
      bottomRight: Radius.circular(size.width * .08),
    );

    return Material(
      color: AppColors.primary,
      borderRadius: borderRadius,
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        highlightColor: AppColors.secondary,
        splashColor: AppColors.secondary,
        borderRadius: borderRadius,
        child: Container(
          height: size.height * .1,
          width: size.width * .4,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          child: Center(
            child: label
          ),
        ),
      ),
    );
  }
}
