import 'package:flutter/material.dart';

import '../../../model/session/order_model.dart';
import '../../../shared/utils/AppColors.dart';

class GroupResumeItemWidget extends StatelessWidget {
  final OrderModel orderModel;
  const GroupResumeItemWidget({Key? key, required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Text(
                  orderModel.name,
                  style: const TextStyle(fontSize: 14),
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
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0),
                  child: SizedBox(
                      width: 40,
                      child: Center(
                        child: Text('',
                            style: TextStyle(fontSize: 10)),
                      )),
                ),
                Container(
                  width: 1,
                  height: 24,
                  color: AppColors.secondary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0),
                  child: SizedBox(
                      width: 40,
                      child: Center(
                        child: Text("${orderModel.value}",
                            style: const TextStyle(fontSize: 10)),
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
