import 'package:flutter/material.dart';
import 'package:partypay/model/restaurant/restaurant_model.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class RoundRestaurantCardWidget extends StatelessWidget {
  final RestaurantModel restaurant;
  final Shape shape;
  final bool selected;
  final VoidCallback onTap;
  const RoundRestaurantCardWidget({Key? key,required this.restaurant, required this.shape, this.selected = false, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: selected ? 0 : 6.0,vertical:selected ? 0 : 6.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(restaurant.image),
            ),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(shape == Shape.ROUND ? 100 : 20),
            border: selected ? Border.fromBorderSide(BorderSide(width: 3, color: AppColors.secondary)) : null,
            boxShadow: [
              BoxShadow(
                  offset: Offset.fromDirection(1, 1.5),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  color: AppColors.shadow),
            ],
          ),
        ),
      ),
    );
  }
}

enum Shape {
  ROUND, SQUARE
}
