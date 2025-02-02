import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String languageCode ='en';
  ThemeMode  themeMode = ThemeMode.dark;
  bool get isDark => themeMode == ThemeMode.dark;

  void changeTheme(ThemeMode theme){
    themeMode = theme;
    notifyListeners();
  }

  void changeLanguage (String language){
    languageCode = language;
    notifyListeners();
  }
}