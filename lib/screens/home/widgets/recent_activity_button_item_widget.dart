import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class RecentActivityButtonItemWidget extends StatelessWidget {
  final String image;
  final String price;

  const RecentActivityButtonItemWidget(
      {Key? key, required this.image, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: AppColors.white,
                image: DecorationImage(
                  image: AssetImage(image),
                ),
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                      offset: Offset.fromDirection(1, 0.5),
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                      color: Colors.black26)
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(price),
        )
      ],
    );
  }
}
