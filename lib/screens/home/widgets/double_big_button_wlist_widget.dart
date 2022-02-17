import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';

import 'recent_activity_button_item_widget.dart';

class DoubleBigButtonWListWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const DoubleBigButtonWListWidget(
      {Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: size.height * 0.135,
          width: size.width * 0.60,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: size.height * 0.13,
                  width: size.width * 0.59,
                  color: AppColors.secondary,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Material(
                  color: AppColors.primary,
                  child: InkWell(
                    onTap: onTap,
                    highlightColor: AppColors.secondary,
                    splashColor: AppColors.secondary,
                    child: Container(
                      height: size.height * 0.13,
                      width: size.width * 0.59,
                      child: Center(
                        child: Text(
                          label,
                          style: const TextStyle(
                              fontSize: 22,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RecentActivityButtonItemWidget(image: AppImages.smallOutback, price: 'R\$87,99',),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
              child: Container(height: 1,width: 50,color: AppColors.secondary,),
            ),
            RecentActivityButtonItemWidget(image: AppImages.smallSiSenor, price: 'R\$159,99',),
          ],
        ),
        const SizedBox()
      ],
    );
  }
}
