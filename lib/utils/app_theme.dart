import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff5669FF);
  static const Color backGroundLight = Color(0xffF2FEFF);
  static const Color backGroundDark = Color(0xff101127);
  static const Color black = Color(0xff1C1C1C);
  static const Color white = Color(0xffffffff);
  static const Color grey = Color(0xff7B7B7B);
  static const Color red = Color(0xffFF5659);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: backGroundLight,
      foregroundColor: primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: black,
      ),
    ),
    scaffoldBackgroundColor: backGroundLight,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: grey,
        ),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: grey,
        ),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: red,
        ),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: red,
        ),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    textTheme: const TextTheme(
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: black,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      )
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: white,
      unselectedItemColor: white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: white,
      shape: CircleBorder(
        side: BorderSide(color: white,width: 5,)
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
