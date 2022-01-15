import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';

const logoName = 'PartyPay!';
const catchPhrase = 'Share your Bills.';

class SplashPage extends StatelessWidget {
  const  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 15),
            Text(
              logoName,
              style: GoogleFonts.rammettoOne(
                  fontSize: 36, color: AppColors.primary),
            ),
            Text(
              catchPhrase,
              style:
                  GoogleFonts.redRose(fontSize: 24, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
