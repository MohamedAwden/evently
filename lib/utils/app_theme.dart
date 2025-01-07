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
  );
  static ThemeData darkTheme = ThemeData();
}