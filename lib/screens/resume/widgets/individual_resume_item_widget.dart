import 'package:flutter/material.dart';
import 'package:partypay/model/session/session_order_model.dart';

import '../../../shared/utils/AppColors.dart';

class IndividualResumeItem extends StatelessWidget {
  final SessionOrderModel sessionOrder;
  const IndividualResumeItem({Key? key, required this.sessionOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * .95,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.lunch_dining,
                  color: AppColors.primary,
                  size: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 1,
                    height: 50,
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  sessionOrder.order.name,
                  style: const TextStyle(fontSize: 14),
                )
              ],
            ),
            Text(
              "R\$${sessionOrder.order.value/sessionOrder.userList.length}",
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
