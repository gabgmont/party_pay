import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partypay/screens/login/widgets/input_text.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topRight,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: size.width * 0.78,
                height: size.height * 0.81,
                decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(25))),
              ),
              Container(
                width: size.width * 0.8,
                height: size.height * 0.8,
                decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        AppImages.logo,
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'Login',
                        style: GoogleFonts.roboto(
                            fontSize: 48, color: AppColors.white),
                      ),
                      SizedBox(height: 20,),
                      InputTextWidget(),
                      SizedBox(height: 20,),
                      InputTextWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
