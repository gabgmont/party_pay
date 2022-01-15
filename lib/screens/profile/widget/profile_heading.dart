import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';

class ProfileHeading extends StatelessWidget {
  const ProfileHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                offset: Offset.fromDirection(1.5),
                blurRadius: 0.5,
                spreadRadius: 0.5,
                color: AppColors.shadow)
          ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.edit,
                      color: AppColors.primary,
                      size: 36,
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.logout,
                    color: AppColors.red,
                    size: 36,
                  ),
                ),
                SizedBox(),
                SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Gabriel',
                        style: TextStyle(fontSize: 16, color: AppColors.gray),
                      ),
                      Text(
                        '000.000.000-22',
                        style: TextStyle(color: AppColors.gray),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: size.height * 0.15,
                    width: size.height * 0.15,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.userPicture),
                            fit: BoxFit.fill),
                        border: Border.fromBorderSide(
                            BorderSide(width: 1, color: AppColors.primary)),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
