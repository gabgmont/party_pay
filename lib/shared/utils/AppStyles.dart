import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AppColors.dart';

class AppStyles {

  static TextStyle mainLabel({Color color = AppColors.white, bool bold = false}) => GoogleFonts.reemKufi(
      fontSize: 24, color: color, fontWeight: bold ? FontWeight.bold : FontWeight.normal);

  static TextStyle logoLabel({Color color = AppColors.white}) => GoogleFonts.reemKufi(
      fontSize: 34, color: color, fontWeight: FontWeight.normal);

  static TextStyle welcomeProfile({bool bold = false}) => GoogleFonts.reemKufi(
      fontSize: 14, color: AppColors.white, fontWeight: bold ? FontWeight.bold : FontWeight.normal);

  static TextStyle profileField(bool active) => GoogleFonts.reemKufi(
      fontSize: 14, color: active ? AppColors.black : AppColors.gray);

  static TextStyle formField({bool isHint = false}) => GoogleFonts.reemKufi(
      fontSize: 18, color: isHint ? AppColors.gray : AppColors.black);

  static TextStyle iconButtonLabel() => GoogleFonts.reemKufi(
      fontSize: 12, color: AppColors.black);

  static TextStyle orderName({Color color = AppColors.black}) => GoogleFonts.reemKufi(
      fontSize: 16, color: color);

  static TextStyle orderDescription() => GoogleFonts.reemKufi(
      fontSize: 10, color: AppColors.black);
}
