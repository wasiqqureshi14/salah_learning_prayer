import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF016568);
  static const background = Color(0xFF016568);
  static const card = Color(0xFF6FD3CF);
  static const white = Colors.white;
  static const darkText = Color(0xFF0F2F2F);
}
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    fontFamily: 'Poppins',

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.white70,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.white,
        shape: const CircleBorder(),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark();
}
