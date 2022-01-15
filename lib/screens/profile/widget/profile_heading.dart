import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';
import 'package:partypay/shared/utils/string_filter.dart';

class ProfileHeading extends StatelessWidget {
  final VoidCallback onEditPressed;
  final VoidCallback onLogoutPressed;
  final String name;
  final String cpf;

  const ProfileHeading({
    Key? key,
    required this.name,
    required this.cpf,
    required this.onEditPressed,
    required this.onLogoutPressed,
  }) : super(key: key);

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
          child: Material(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                          color: AppColors.primary,
                          splashRadius: 25,
                          icon: const Icon(
                            Icons.edit,
                            size: 36,
                          ),
                          onPressed: onEditPressed,
                          )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                        color: AppColors.red,
                        splashRadius: 25,
                        icon: const Icon(
                          Icons.logout,
                          size: 36,
                        ),
                        onPressed: onLogoutPressed,
                        ),
                  ),
                  const SizedBox(),
                  SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          StringFilter.getFirstName(name),
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.gray),
                        ),
                        Text(
                          cpf,
                          style: const TextStyle(color: AppColors.gray),
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
                          image: const DecorationImage(
                              image: AssetImage(AppImages.userPicture),
                              fit: BoxFit.fill),
                          border: const Border.fromBorderSide(
                              BorderSide(width: 1, color: AppColors.primary)),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
