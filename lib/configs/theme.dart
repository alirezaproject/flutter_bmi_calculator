import 'package:bmi_calculator/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextStyle _darkTitleLarge = GoogleFonts.roboto().copyWith(
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 35,
  );

  static final TextStyle _darkDisplaySmall = GoogleFonts.roboto().copyWith(
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static final TextStyle _darkBodySmall = GoogleFonts.roboto().copyWith();

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.sliderActiveColor,
        inactiveTrackColor: AppColors.sliderInActiveColor,
        thumbColor: AppColors.primaryColor,
        valueIndicatorTextStyle: _darkBodySmall,
        valueIndicatorColor: AppColors.primaryColor,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: TextTheme(
        titleLarge: _darkTitleLarge,
        displaySmall: _darkDisplaySmall,
        bodySmall: _darkBodySmall,
      ),
    );
  }
}
