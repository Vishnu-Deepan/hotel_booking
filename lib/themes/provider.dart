import 'package:flutter/material.dart';

import 'custom_colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeData get themeData => _themeMode == ThemeMode.light
      ? AppThemes.lightTheme
      : AppThemes.darkTheme;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

class AppThemes {
  //LIGHT  THEME
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: CColors.lightPrimary,
    scaffoldBackgroundColor: Colors.white,
    cardColor: CColors.lightCard,
  );


  //DARK THEME
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: CColors.darkPrimary,
    scaffoldBackgroundColor: const Color(0xff0b0c15),
    cardColor: CColors.darkCard,
  );
}
