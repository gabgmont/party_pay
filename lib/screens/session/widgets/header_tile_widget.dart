import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class HeaderTileWidget extends StatelessWidget {
  final IconData icon;
  final String data;
  final double height;
  final double width;

  const HeaderTileWidget(
      {Key? key, required this.icon, required this.data, this.height = 0, this.width = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: height, //size.height * 0.054,
      width: width, //size.width * 0.254,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: height * 0.9, //size.height * 0.05,
              width: width * 0.9, //size.width * 0.25,
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(200)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: size.height * 0.05,
              width: size.width * 0.25,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(200)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(data)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
