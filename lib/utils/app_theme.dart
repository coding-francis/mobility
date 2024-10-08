import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: MaterialColor(0xFF008000, {
      50: AppColors.defaultColor,
      100: AppColors.defaultColor,
      200: AppColors.defaultColor,
      300: AppColors.defaultColor,
      400: AppColors.defaultColor,
      500: AppColors.defaultColor,
      600: AppColors.defaultColor,
      700: AppColors.defaultColor,
      800: AppColors.defaultColor,
      900: AppColors.defaultColor,
    }),
    fontFamily: 'Raleway',
    scaffoldBackgroundColor: Colors.grey[100],
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.defaultColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        fontFamily: 'Raleway',
        color: AppColors.defaultColor,
      ),
      contentPadding: const EdgeInsets.all(15),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.defaultColor,
          )),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontFamily: 'Raleway',
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[100],
      actionsIconTheme: IconThemeData(
        color: AppColors.defaultColor,
      ),
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Raleway',
      ),
      iconTheme: IconThemeData(
        color: AppColors.defaultColor,
      ),
    ),
  );
}
