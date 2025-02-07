import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';



ThemeData getLightTheme() {
  ///Todo:  change font dynamically
  return ThemeData(
      scaffoldBackgroundColor: AppColors.mainColor,
      primaryColor: AppColors.mainColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0, foregroundColor: Colors.white),
      brightness: Brightness.light,
      dividerColor: AppColors.accentColor.withAlpha(1),
      focusColor: AppColors.accentColor,
      hintColor: AppColors.secondaryColor,
      cardColor: AppColors.secondaryColor,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.mainColor),
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.mainColor,
        secondary: AppColors.mainColor,
        surface: AppColors.whiteColor
      ),
      textTheme: GoogleFonts.getTextTheme(
        'Poppins',
        const TextTheme(
          titleLarge: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: AppColors.mainColor,
              height: 2.2),
          titleMedium: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColors.mainColor,
              height: 1.2),
          titleSmall: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor,
              height: 1.2),
          headlineSmall: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: AppColors.secondaryColor,
              height: 1.3),
          headlineMedium: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryColor,
              height: 1.3),
          displaySmall: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: AppColors.secondaryColor,
              height: 1.3),
          displayMedium: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: AppColors.mainColor,
              height: 2.4),
          displayLarge: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w900,
              color: AppColors.secondaryColor,
              height: 2.4),


          bodyMedium: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryColor,
              height: 1.2),
          bodyLarge: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryColor,
              height: 1.2),
          bodySmall: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w300,
              color: AppColors.whiteColor,
              height: 1.0),
        ),
      ));
}




