import 'package:flutter/material.dart';

import '../../../shared/utils/AppColors.dart';

class EnterButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const EnterButtonWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .08,
      width: size.width * .7,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: size.height * .075,
              width: size.width * .69,
              color: AppColors.secondary,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Material(
              color: AppColors.primary,
              child: InkWell(
                onTap: onTap,
                highlightColor: AppColors.secondary,
                splashColor: AppColors.secondary,
                child: SizedBox(
                  height: size.height * .075,
                  width: size.width * .69,
                  child: Center(
                    child: Text(
                      'Confirmar',
                      style: TextStyle(
                          fontSize: size.height * .04, color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
