import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class HeaderTileWidget extends StatelessWidget {
  final IconData icon;
  final String data;
  final double height;

  const HeaderTileWidget(
      {Key? key,
      required this.icon,
      required this.data,
      this.height = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: height * 0.9,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(200),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.shadow,
                      offset: Offset.fromDirection(1),
                      blurRadius: .5,
                      spreadRadius: .5)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: AppColors.primary,
                      size: size.height * .035,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(data)
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: size.height * 0.05,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: AppColors.primary,
                      size: size.height * .035,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(data)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
