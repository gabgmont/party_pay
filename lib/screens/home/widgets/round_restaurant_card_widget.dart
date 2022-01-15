import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class RoundRestaurantCardWidget extends StatelessWidget {
  final String image;
  const RoundRestaurantCardWidget({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                offset: Offset.fromDirection(1, 1.5),
                spreadRadius: 0.5,
                blurRadius: 0.5,
                color: AppColors.shadow),
          ],
        ),
      ),
    );
  }
}
