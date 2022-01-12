import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partypay/shared/utils/AppColors.dart';

const username = 'Username';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.6,
      height: size.height * 0.06,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: size.width * 0.59,
              height: size.height * 0.055,
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
                  style: GoogleFonts.roboto(fontSize: 20),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: username
                  ),
                ),
              ),
            ),)
        ],
      ),
    );
  }
}
