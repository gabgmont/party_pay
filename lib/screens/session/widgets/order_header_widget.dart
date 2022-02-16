import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class OrderHeaderWidget extends StatelessWidget {
  const OrderHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .06,
      width: size.width,
      color: AppColors.secondary,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.list, color: AppColors.white, size: size.height * .05,),
                Text('Orders', style: TextStyle(color: AppColors.white, fontSize: size.height * .03),),
              ],
            ),
            Icon(Icons.add, color: AppColors.white, size: size.height * .05,)
          ],
        ),
      ),
    );
  }
}
