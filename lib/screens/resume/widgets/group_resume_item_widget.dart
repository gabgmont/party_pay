import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partypay/shared/utils/AppStyles.dart';

import '../../../model/session/order_model.dart';
import '../../../shared/utils/AppColors.dart';

class GroupResumeItemWidget extends StatelessWidget {
  final OrderModel orderModel;

  const GroupResumeItemWidget({Key? key, required this.orderModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.lunch_dining,
                  color: AppColors.primary,
                  size: 24,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 1,
                    height: 24,
                    color: AppColors.secondary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: SizedBox(
                    width: size.width*.5,
                    child: Text(
                      orderModel.name,
                      style: AppStyles.orderName(),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 1,
                  height: 24,
                  color: AppColors.secondary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(orderModel.valuePerUser.toStringAsFixed(2),
                            style: GoogleFonts.reemKufi(fontSize: 10)),
                      )),
                ),
                Container(
                  width: 1,
                  height: 24,
                  color: AppColors.secondary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(orderModel.value.toStringAsFixed(2),
                            style: GoogleFonts.reemKufi(fontSize: 10)),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
