import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppStyles.dart';

const username = 'Username';

class DoubleInputTextWidgetWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hint;
  final bool obscureText;

  const DoubleInputTextWidgetWidget(
      {Key? key,
      required this.hint,
      required this.textController,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.06,
      width: size.width * 0.6,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: size.height * 0.055,
              width: size.width * 0.59,
              color: AppColors.secondary,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: size.width * 0.59,
              height: size.height * 0.055,
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
                child: TextFormField(
                  obscureText: obscureText,
                  style: AppStyles.formField(),
                  textAlignVertical: TextAlignVertical.center,
                  controller: textController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: AppStyles.formField(isHint: true),
                    contentPadding: const EdgeInsets.only(
                      bottom: 12,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
