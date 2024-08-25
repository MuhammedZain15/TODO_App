import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  String currentLanguageCode = "en";
  ThemeMode currentThemeMode = ThemeMode.light;

  void changeLanguageCode(String newLanguageCode) {
    if (currentLanguageCode == newLanguageCode) return;
    currentLanguageCode = newLanguageCode;
    notifyListeners();
  }

  void changeThemeMode(ThemeMode newThemeMode) {
    if (currentThemeMode == newThemeMode) return;
    currentThemeMode = newThemeMode;
    notifyListeners();
  }


  bool isDark() {
    return currentThemeMode == ThemeMode.dark;
  }
}
