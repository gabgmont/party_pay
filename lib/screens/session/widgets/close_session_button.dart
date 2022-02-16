import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class CloseSessionButton extends StatelessWidget {
  final VoidCallback onTap;
  const CloseSessionButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(size.width * .15),
      topRight: Radius.circular(size.width * .15),
      bottomLeft: Radius.circular(size.width * .08),
      bottomRight: Radius.circular(size.width * .08),
    );

    return Material(
      color: AppColors.primary,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Container(
          height: size.height * .1,
          width: size.width * .4,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Text.rich(
              TextSpan(
                text: 'Close\n',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: size.height * .046,
                ),
                children: [
                  TextSpan(
                    text: 'Session',
                    style: TextStyle(
                        color: AppColors.white, fontSize: size.height * .028),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
