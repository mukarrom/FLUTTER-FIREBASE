import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/app_colors.dart';

class AppThemeData {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      scaffoldBackgroundColor: Colors.white,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
      ),
      inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          // border add
          side: const BorderSide(color: AppColors.themeColor),
          fixedSize: const Size.fromWidth(double.maxFinite),
          // backgroundColor: AppColors.themeColor,
          // foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
    );
  }

  static ThemeData get darkThemeData {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
      brightness: Brightness.dark,
      // scaffoldBackgroundColor: Colors.white,
    );
  }
}
